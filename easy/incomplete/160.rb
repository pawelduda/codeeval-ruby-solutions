# https://www.codeeval.com/browse/160/

def to_minutes_and_seconds(angle)
  angle_parts = angle.to_s.split('.')
  fractional_part = ('0.' + angle_parts[1]).to_f
  minutes_remainder = (fractional_part * 60)
  minutes = minutes_remainder.to_s.split('.')[0].rjust(2, '0')
  fractional_part = ('0.' + minutes_remainder.to_s.split('.')[1]).to_f
  seconds = (fractional_part * 60).to_s.split('.')[0].rjust(2, '0')
  %Q{#{angle_parts[0]}.#{minutes}'#{seconds}"}
end

File.open(ARGV[0]).each_line do |line|
  puts to_minutes_and_seconds(line.strip)
end

# tests
# p to_minutes_and_seconds(0.5) == %q{0.30'00"}
# p to_minutes_and_seconds(330.39991833) == %q{330.23'59"}
# p to_minutes_and_seconds(0.001) == %q{0.00'03"}
# p to_minutes_and_seconds(14.64530319) == %q{14.38'43"}
# p to_minutes_and_seconds(0.25) == %q{0.15'00"}
# p to_minutes_and_seconds(254.16991217) == %q{254.10'11"}
