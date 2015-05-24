# https://www.codeeval.com/browse/160/

def to_minutes_and_seconds(angle)
  angle_parts = angle.to_s.split('.').map(&:to_i)
  minutes_remainder = angle_parts[1] * 60 / 100.0
  minutes = minutes_remainder.to_i.to_s[0..1].rjust(2, '0')
  seconds = (minutes_remainder.to_s[2..-1].to_i * 60 / 100.0).to_i.to_s[0..1].rjust(2, '0')
  %Q{#{angle_parts[0].to_s}.#{minutes}'#{seconds}"}
end

# File.open(ARGV[0]).each_line do |line|
#   puts to_minutes_and_seconds(line.strip)
# end

# tests
p to_minutes_and_seconds(0.5) == %q{0.30'00"}
p to_minutes_and_seconds(330.39991833) == %q{330.23'59"}
p to_minutes_and_seconds(0.001) == %q{0.00'03"}
p to_minutes_and_seconds(14.64530319) == %q{14.38'43"}
p to_minutes_and_seconds(0.25) == %q{0.15'00"}
p to_minutes_and_seconds(254.16991217) == %q{254.10'11"}
