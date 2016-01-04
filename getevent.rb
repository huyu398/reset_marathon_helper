# getevent.rb
time = Time.now
 
$stdin.each_line do |line|
  array = [$1.to_i(16), $2.to_i(16), $3.to_i(16)] if line =~ /([0-9a-f]+) ([0-9a-f]+) ([0-9a-f]+)/
  _time = Time.now
  $stdout.puts "sleep #{_time - time}" if _time - time > 0.1
  $stdout.puts "sendevent /dev/input/event0 #{array[0]} #{array[1]} #{array[2]}"
  time = _time
end
