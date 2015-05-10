# https://www.codeeval.com/browse/183/

def get_amount_of_moves(ascii_field)
  field_lines = ascii_field.split(',')

  field_lines.map do |field_line|
    return 0 if field_line.include? 'XY'
    /X{1}(\.+)Y{1}/.match(field_line)[1].count('.')
  end.sort[0]
end

File.open(ARGV[0]).each_line do |line|
  puts get_amount_of_moves(line.strip)
end

# tests
=begin
p get_amount_of_moves('XX.YY,XXX.Y,X..YY,XX..Y') == 1
p get_amount_of_moves('XXX.YYYY,X...Y..Y,XX..YYYY,X.....YY,XX....YY') == 1
p get_amount_of_moves('XX...YY,X....YY,XX..YYY,X..YYYY') == 2
p get_amount_of_moves('XXYY,X..Y,XX.Y') == 0
=end
