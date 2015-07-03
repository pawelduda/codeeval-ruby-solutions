# https://www.codeeval.com/browse/78/
#
# [1, 4, 2, 3]
# [2, 3, 1, 4]
# [4, 2, 3, 1]
# [3, 1, 4, 2]
#
# [2, 1, 3, 2]
# [3, 2, 1, 4]
# [1, 4, 2, 3]
# [2, 3, 4, 1]

require 'rspec'

class SudokuValidator
  attr_reader :board, :size

  def initialize(input)
    @board = []
    parse_input(input)
  end

  def row(index)
    @board[index - 1]
  end

  def column(index)
    @board.map { |row| row[index - 1] }
  end

  def cell(index)
    cell = []
    
    ((index - 1)..(Math.sqrt(size - 1))).each do |i|
      ((index - 1)..(Math.sqrt(size - 1))).each do |j|
        cell << @board[i][j]
      end
    end

    p   cell
    cell
  end

  def validate_columns
    (0..(size - 1)).each { |index| return 'False' if validate_column(index) == false }
    'True'
  end

  def validate_rows
    (0..(size - 1)).each { |index| return 'False' if validate_row(index) == false }
    'True'
  end

  def validate_cells
    (0..(size - 1)).each { |index| return 'False' if validate_cell(index) == false }
    'True'
  end

  private

  def parse_input(input)
    input = input.split(';')
    @size = input[0].to_i
    @board = input[1].split(',').map(&:to_i).each_slice(@size).to_a
  end

  def validate_column(index)
    return false if (1..size).to_a != column(index).sort
  end

  def validate_row(index)
    return false if (1..size).to_a != row(index).sort
  end

  def validate_cell(index)
    return false if (1..size).to_a != cell(index).sort
  end
end

##### TESTS #####

describe SudokuValidator do
  before do
    @test_board1 = SudokuValidator.new('4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2')
    @test_board2 = SudokuValidator.new('4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1')
  end
  
  it 'should parse input numbers' do
    expect(@test_board1.board).to eq [[1, 4, 2, 3], [2, 3, 1, 4], [4, 2, 3, 1], [3, 1, 4, 2]]
    expect(@test_board2.board).to eq [[2, 1, 3, 2], [3, 2, 1, 4], [1, 4, 2, 3], [2, 3, 4, 1]]
  end

  context 'should get' do
    it 'columns by number' do
      expect(@test_board1.column(1)).to eq [1, 2, 4, 3]
      expect(@test_board2.column(1)).to eq [2, 3, 1, 2]
    end

    it 'rows by number' do
      expect(@test_board1.row(1)).to eq [1, 4, 2, 3]
      expect(@test_board2.row(1)).to eq [2, 1, 3, 2]
    end

    it 'cells by number' do
      expect(@test_board1.cell(1)).to eq [1, 4, 2, 3]
      expect(@test_board2.cell(1)).to eq [2, 1, 3, 2]
    end
  end

  context 'should validate' do
    context 'columns' do
      it 'all' do
        expect(@test_board1.validate_columns).to eq 'True'
        expect(@test_board2.validate_columns).to eq 'False'
      end
    end
    
    context 'rows' do
      it 'all' do
        expect(@test_board1.validate_rows).to eq 'True'
        expect(@test_board2.validate_rows).to eq 'False'
      end
    end
    
    context 'cells' do
      it 'all' do
        expect(@test_board1.validate_cells).to eq 'True'
        expect(@test_board2.validate_cells).to eq 'False'
      end
    end
  end
end

# tests
# p 4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2
