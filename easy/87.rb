# https://www.codeeval.com/browse/87/

class Matrix
  def initialize(size)
    @size = size
    @board = Array.new(@size) do |i| 
      i = Array.new(@size) { |j| 0 }
    end
  end

  def exec(str)
    command, *args = str.split(' ')
    args.map!(&:to_i) 

    if command == 'SetCol'
      raise 'Missing argument(s)' if args[0].nil? || args[1].nil?
      set_col(args[0], args[1])
    elsif command == 'SetRow'
      raise 'Missing argument(s)' if args[0].nil? || args[1].nil?
      set_row(args[0], args[1])
    elsif command == 'QueryCol'
      raise 'Missing argument(s)' if args[0].nil?
      query_col(args[0])
    elsif command == 'QueryRow'
      raise 'Missing argument(s)' if args[0].nil?
      query_row(args[0])
    else
      raise 'Invalid command'
    end
  end

  def set_col(index, val)
    @board[index].map! { |x| x = val }
    nil
  end

  def set_row(index, val)
    @board.each { |ary| ary[index] = val }
    nil
  end

  def query_col(index)
    @board[index].reduce(:+)
  end

  def query_row(index)
    @board.inject(0) { |sum, ary| sum + ary[index] }
  end
end

mat = Matrix.new(256)
File.open(ARGV[0]).each_line do |line|
  result = mat.exec(line.strip)
  puts result unless result.nil?
end

# tests
=begin
size = 256

mat = Matrix.new(size)
mat.set_col(1, 5)
p mat.query_col(1) == size * 5

mat = Matrix.new(size)
mat.set_row(0, 5)
p mat.query_row(0) == size * 5

mat = Matrix.new(size)
p mat.exec('SetRow 32 20').nil?

mat = Matrix.new(size)
p mat.exec('SetCol 32 20').nil?
=end