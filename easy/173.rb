# https://www.codeeval.com/browse/173/

def remove_duplicates(str)
  str.split('').chunk { |n| n }.map(&:first).join
end

File.open(ARGV[0]).each_line do |line|
  puts remove_duplicates(line)
end

# tests
=begin
p remove_duplicates('But as he spake he drew the good sword from its scabbard, and smote a heathen knight, Jusssstin of thee Iron Valley.') == 'But as he spake he drew the god sword from its scabard, and smote a heathen knight, Justin of the Iron Valey.'
p remove_duplicates('No matttter whom you choose, she deccccclared, I will abide by your decision.') == 'No mater whom you chose, she declared, I wil abide by your decision.'
p remove_duplicates('Wwwhat is your will?') == 'Wwhat is your wil?'
p remove_duplicates('At his magic speech the ground oppened and he began the path of descent.') == 'At his magic spech the ground opened and he began the path of descent.'
p remove_duplicates('I should fly away and you would never see me again.') == 'I should fly away and you would never se me again.'
=end