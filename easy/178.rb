# https://www.codeeval.com/open_challenges/178/

def rotate_matrix(matrix)
  # sqrt will always work with NxN matrices
  divider = Math.sqrt(matrix.length)
  # divide the matrix into equal chunks
  rotated_matrix = matrix.each_with_index.group_by { |_, i| i % divider }
  # reverse and filter out the garbage that is not needed
  rotated_matrix.values.map(&:reverse).flatten.select { |n| n.is_a?(String) }
end

File.open(ARGV[0]).each_line do |line|
  puts rotate_matrix(line.strip.split(' ')).join(' ')
end

# tests
=begin
p rotate_matrix(['a', 'b', 'c', 'd']) == ['c', 'a', 'd', 'b']
p rotate_matrix(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p']) == ['m', 'i', 'e', 'a', 'n', 'j', 'f', 'b', 'o', 'k', 'g', 'c', 'p', 'l', 'h', 'd']
p rotate_matrix(['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i']) == ['g', 'd', 'a', 'h', 'e', 'b', 'i', 'f', 'c']
=end

=begin
[a b | c d]  =>  [c a | d b]
a b  =>  c a
c d      d b

[a b c | d e f | g h i]  =>  [g d a | h e b | i f c]
a b c      g d a
d e f  =>  h e b
g h i      i f c

[a b c d | e f g h | i j k l | m n o p]  =>  [m i e a | n j f b | o k g c | p l h d]
a b c d      m i e a 
e f g h  =>  n j f b 
i j k l      o k g c 
m n o p      p l h d
=end
