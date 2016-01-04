# analyze.rb

PATH_EVENT_FILE = (ARGV[0]) ? ARGV[0] : "~/touch.txt"
PATH_ADB = (ARGV[1]) ? ARGV[1] : "~/Android/Sdk/build-tools/adb"

PREFIX_COMMAND = "#{File.expand_path(PATH_ADB)} shell input "

MIN_X = 0
MIN_Y = 0
MAX_X = 3071
MAX_Y = 2304
DISPLAY_WIDTH = 1536
DISPLAY_HEIGHT = 2048

f = File.open(File.expand_path(PATH_EVENT_FILE), 'r') 

start_x = 0
start_y = 0
end_x = 0
end_y = 0

f.each_line do |l|
  line = l.split(' ')
  case line[0]
  when "sendevent" then
    case line[3].to_i
    when 53 then
      x = (line[4].to_i - MIN_X) * DISPLAY_WIDTH / (MAX_X - MIN_X + 1)
      start_x = x if start_x.zero?
      end_x = x
    when 54 then
      y = (line[4].to_i - MIN_Y) * DISPLAY_HEIGHT / (MAX_Y - MIN_Y + 1)
      start_y = y if start_y.zero?
      end_y = y
    end
  when "sleep" then
    if (end_x - start_x).abs < 10 && (end_y - start_y).abs < 10
      # $stdout.puts "echo " + PREFIX_COMMAND + "tap #{start_x} #{start_y}"
      $stdout.puts PREFIX_COMMAND + "tap #{start_x} #{start_y}"
    else
      # $stdout.puts "echo " + PREFIX_COMMAND + "tap #{start_x} #{start_y}"
      $stdout.puts PREFIX_COMMAND + "swipe #{start_x} #{start_y} #{end_x} #{end_y}"
    end
    # $stdout.puts "echo #{l}"
    $stdout.puts l
    start_x = 0
    start_y = 0
  else
    puts "unknown error"
  end
end
