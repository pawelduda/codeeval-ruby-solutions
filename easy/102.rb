# https://www.codeeval.com/browse/102/

require 'json'

def get_sum_of_ids_with_label(json)
  json['menu']['items'].compact
    .select { |item| item.has_key?('label') }
    .inject(0) { |sum, n| sum + n['id'] }
end

File.open(ARGV[0]).each_line do |line|
  puts get_sum_of_ids_with_label(JSON.parse(line))
end

# tests
=begin
test_json = '{"menu": {"header": "menu", "items": [{"id": 27}, {"id": 0, "label": "Label 0"}, null, {"id": 93}, {"id": 85}, {"id": 54}, null, {"id": 46, "label": "Label 46"}]}}'

p JSON.parse(test_json)['menu']['items'][0]['id'] == 27
p get_sum_of_ids_with_label(JSON.parse(test_json)) == 46
=end
