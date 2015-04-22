# https://www.codeeval.com/browse/166/

require 'date'

def get_time_diff(start_time, end_time)
  DateTime.parse(start_time) - DateTime.parse(end_time)
end

p get_time_diff('14:01:57', '12:47:11')

