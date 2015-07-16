# https://www.codeeval.com/browse/161

class GameOfLife
  NEIGHBORS_VEC = [
    [-1, -1], [0, -1], [1, -1],
    [-1,  0],          [1,  0],
    [-1,  1], [0,  1], [1,  1]
  ]

  attr_reader :board, :previous_board

  def initialize(input)
    @previous_board = parse_input(input)
    @board = parse_input(input)
  end

  def print_board
    @board.map do |line|
      line.join('')
    end.join("\n")
  end

  def iterate!
    (0..@board.length - 1).each do |y|
      (0..@board[0].length - 1).each do |x|
        process_cell!(x, y)
      end
    end

    @previous_board = Marshal.load(Marshal.dump(@board))
    self
  end

  def neighbors(x, y)
    NEIGHBORS_VEC.map do |vec|
      x_vec = x + vec[0]
      y_vec = y + vec[1]

      if x_vec.between?(0, @previous_board[0].length - 1) && y_vec.between?(0, @previous_board.length - 1)
        @previous_board[y_vec][x_vec]
      else
        nil
      end
    end
  end

  private

  def live_neighbors_count(x, y)
    neighbors(x, y).count('*')
  end

  def process_cell!(x, y)
    count = live_neighbors_count(x, y)

    if count < 2 && @previous_board[y][x] == '*'
      @board[y][x] = '.'
    elsif count > 3 && @previous_board[y][x] == '*'
      @board[y][x] = '.'  
    elsif count == 3 && @previous_board[y][x] == '.'
      @board[y][x] = '*'
    end
  end

  def parse_input(input)
    board = []
    
    input.each_line.map do |line|
       board << line.strip.split('')
    end

    board
  end
end

##### CODEEVAL INPUT #####

input = ''
File.open(ARGV[0]).each_line { |line| input << line }
game_of_life = GameOfLife.new(input)
10.times { game_of_life.iterate! }
puts game_of_life.print_board

##### TESTS #####

# test_input_codeeval = '.........*
# .*.*...*..
# ..........
# ..*.*....*
# .*..*...*.
# .........*
# ..........
# .....*..*.
# .*....*...
# .....**...'

# game_of_life_codeeval = GameOfLife.new(test_input_codeeval)
# 10.times { game_of_life_codeeval.iterate! }
# puts game_of_life_codeeval.print_board
