def get_age_desc(age)
  case
  when (0..2) === age 
    'Still in Mama\'s arms'
  when (3..4) === age 
    'Preschool Maniac'
  when (5..11) === age 
    'Elementary school'
  when (12..14) === age 
    'Middle school'
  when (15..18) === age 
    'High school'
  when (19..22) === age 
    'College'
  when (23..65) === age 
    'Working for the man'
  when (66..100) === age 
    'The Golden Years'
  when (age > 100 || age < 0)
    'This program is for humans'
  end
end

File.open(ARGV[0]).each_line do |line|
  puts get_age_desc(line.strip.to_i)
end

# tests
=begin
p get_age_desc(-1) == 'This program is for humans'
p get_age_desc(101) == 'This program is for humans'
p get_age_desc(100) == 'The Golden Years'
=end
