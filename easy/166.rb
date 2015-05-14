# https://www.codeeval.com/browse/166/

def delta_time(time_1, time_2)
  # separate hours, minutes, seconds
  time1_separated = time_1.split(':').map(&:to_i)
  time2_separated = time_2.split(':').map(&:to_i)

  delta_time = []

  # get time difference in seconds
  time1_seconds = time1_separated[2] + time1_separated[1] * 60 + time1_separated[0] * 3600
  time2_seconds = time2_separated[2] + time2_separated[1] * 60 + time2_separated[0] * 3600
  delta_time_seconds = (time2_seconds - time1_seconds).abs

  # convert time difference in seconds to hours, minutes and seconds
  delta_time[0] = (delta_time_seconds / 3600).floor
  delta_time[1] = (delta_time_seconds / 60).floor - (delta_time[0] * 60)
  delta_time[2] = (delta_time_seconds).floor - (delta_time[1] * 60 + delta_time[0] * 3600)

  # return padded time string
  delta_time.map { |t| t.to_s.rjust(2, '0') }.join(':')
end

File.open(ARGV[0]).each_line do |line|
  times = line.strip.split(' ')
  puts delta_time(times[1], times[0])
end

# tests
=begin
p delta_time('00:00:40', '00:00:20') == '00:00:20'
p delta_time('00:01:30', '00:00:10') == '00:01:20'
p delta_time('00:01:30', '00:00:40') == '00:00:50'
p delta_time('14:01:57', '12:47:11') == '01:14:46'
p delta_time('13:09:42', '22:16:15') == '09:06:33'
p delta_time('08:08:06', '08:38:28') == '00:30:22'
p delta_time('23:35:07', '02:49:59') == '20:45:08'
p delta_time('14:31:45', '14:46:56') == '00:15:11'
=end
