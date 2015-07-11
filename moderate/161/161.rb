# https://www.codeeval.com/browse/161

require 'rspec'

class GameOfLife
  NEIGHBORS_VEC = [
    [-1, -1],
    [0, -1],
    [1, -1],
    [-1, 0],
    [1, 0],
    [-1, 1],
    [0, 1],
    [1, 1]
  ]

  def initialize(input)
    @previous_board = parse_input(input)
    @board = @previous_board.dup
  end

  def iterate!
    (0..board.length).each do |x|
      (0..board[0].length).each do |y|
        process_cell!(x, y)
      end
    end

    self
  end

  def board
    @board.map do |line|
      line.join('')
    end.join("\n")
  end

  private

  def neighbors(x, y)
    NEIGHBORS_VEC.map do |vec|
      p @previous_board
      @previous_board[x + vec[0]][y + vec[1]]
    end
  end

  def live_neighbors_count(x, y)
    neighbors(x, y).count('*')
  end

  def process_cell!(x, y)
    count = live_neighbors_count(x, y)

    if count < 2 && @previous_board[x][y] == '*'
      @board[x][y] = '.'
    elsif count > 3 && @previous_board[x][y] == '*'
      @board[x][y] = '.'  
    elsif count == 3 && @previous_board[x][y] == '.'
      @board[x][y] = '*'
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

##### TESTS #####

test_input = '.........*
.*.*...*..
..........
# ..*.*....*
# .*..*...*.
# .........*
# ..........
# .....*..*.
.*....*...
.....**...'

test_input2 = 
'...
.*.
..*'

describe GameOfLife do
  let(:game_of_life) { GameOfLife.new(test_input) }

  it 'should parse the input properly' do
    expect(game_of_life.board).to eq test_input
  end

  context 'cell' do
    it 'any live cell with fewer than two live neighbors dies, as if caused by under-population.' do
      game_of_life = GameOfLife.new('...
.*.
..*').iterate!

      expect(game_of_life.board).to eq '...
...
...'
    end

    it 'any live cell with two or three live neighbors lives on to the next generation' do
      pending
    end

    it 'any live cell with more than three live neighbors dies, as if by overcrowding' do
      pending
    end

    it 'any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction' do
      pending
    end
  end
end
