# https://www.codeeval.com/browse/161
# ***
# **.
# ...

require 'rspec'

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
    process_cell!(0, 0)
    process_cell!(0, 1)
    process_cell!(0, 2)
    process_cell!(1, 0)
    process_cell!(1, 1)
    process_cell!(1, 2)
    process_cell!(2, 0)
    process_cell!(2, 1)
    process_cell!(2, 2)

    # p @board
    # p @previous_board
    self
  end

  def neighbors(x, y)
    NEIGHBORS_VEC.map do |vec|
      x_vec = x + vec[0]
      y_vec = y + vec[1]

      if x_vec.between?(0, @previous_board[0].length - 1) && y_vec.between?(0, @previous_board.length - 1)
        @previous_board[x_vec][y_vec]
      else
        nil
      end
    end
  end

  private

  def live_neighbors_count(x, y)
    # p neighbors(x, y)
    neighbors(x, y).count('*')
  end

  def process_cell!(x, y)
    count = live_neighbors_count(x, y)
    # p count
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

test_input = '***
**.
...'

describe GameOfLife do
  let(:game_of_life) { GameOfLife.new(test_input) }

  it 'should parse the input' do
    expect(game_of_life.print_board).to eq '***
**.
...'
  end

  it 'should assign cells to proper indices' do
    expect(
      [
        game_of_life.board[0][0],
        game_of_life.board[0][1],
        game_of_life.board[0][2],
        game_of_life.board[1][0],
        game_of_life.board[1][1],
        game_of_life.board[1][2],
        game_of_life.board[2][0],
        game_of_life.board[2][1],
        game_of_life.board[2][2]
      ]
    ).to eq %w(* * * * * . . . .)
  end

# ***
# **.
# ...


  it 'should fetch neighbors of a cell' do
    expect(game_of_life.neighbors(0, 0)).to eq [nil, nil, nil, nil, '*', nil, '*', '*']
    expect(game_of_life.neighbors(2, 0)).to eq [nil, nil, nil, '*', nil, '*', '.', nil]
    expect(game_of_life.neighbors(1, 1)).to eq ['*', '*', '*', '*', '.', '.', '.', '.']
    expect(game_of_life.neighbors(2, 2)).to eq ['*', '.', nil, '.', nil, nil, nil, nil]
  end

  context 'cell' do 
    it 'any live cell with fewer than two live neighbors dies, as if caused by under-population.' do
      game_of_life = GameOfLife.new('...
.*.
..*').iterate!

      expect(game_of_life.print_board).to eq '...
...
...'
    end

    it 'any live cell with two or three live neighbors lives on to the next generation' do
      game_of_life = GameOfLife.new('**.
**.
...').iterate!

      expect(game_of_life.print_board).to eq '**.
**.
...'
    end

    it 'any live cell with more than three live neighbors dies, as if by overcrowding', focus: true do
      game_of_life = GameOfLife.new('***
**.
...').iterate!
      puts game_of_life.print_board
      expect(game_of_life.print_board).to eq '*.*
*.*
...'
    end    
  end
end

# test_input = '.........*
# .*.*...*..
# ..........
# ..*.*....*
# .*..*...*.
# .........*
# ..........
# .....*..*.
# .*....*...
# .....**...'

# describe GameOfLife do
#   let(:game_of_life) { GameOfLife.new(test_input) }

#   it 'should parse the input properly' do
#     expect(game_of_life.print_board).to eq test_input
#   end

#   context 'cell' do
#     it 'any live cell with fewer than two live neighbors dies, as if caused by under-population.' do
#       game_of_life = GameOfLife.new('...
# .*.
# ..*').iterate!

#       expect(game_of_life.print_board).to eq '...
# ...
# ...'
#     end

#     it 'any live cell with two or three live neighbors lives on to the next generation' do
#       game_of_life = GameOfLife.new('**.
# **.
# ...').iterate!

#       expect(game_of_life.print_board).to eq '**.
# **.
# ...'
#     end

#     it 'any live cell with more than three live neighbors dies, as if by overcrowding', focus: true do
#       game_of_life = GameOfLife.new('***
# **.
# ...').iterate!
#       puts game_of_life.print_board
#       expect(game_of_life.print_board).to eq '*.*
# *.*
# ...'

# # ***
# # **.
# # ...


# # *.*
# # *.*
# # ...

# # *..
# # **.
# # ...
#     end

#     it 'any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction' do
#       pending
#     end
#   end
# end
