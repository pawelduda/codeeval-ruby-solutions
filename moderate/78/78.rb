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
  attr_reader :board, :size, :cells

  def initialize(input)
    parse_input(input)
    init_cells
  end

  def row(index)
    @board[index - 1]
  end

  def column(index)
    @board.map { |row| row[index - 1] }
  end

  def cell(index)
    index = index - 1
    limit = Math.sqrt(size) - 1    
    cell = []
    
    (@cells[index][0]..@cells[index][0] + limit).each do |i|
      (@cells[index][1]..@cells[index][1] + limit).each do |j|
        cell << @board[i][j]
      end
    end

    cell
  end

  def validate
    validate_columns && validate_rows && validate_cells ? 'True' : 'False'
  end

  def validate_columns
    (1..size).each { |index| return false if validate_column(index) == false }
    true
  end

  def validate_rows
    (1..size).each { |index| return false if validate_row(index) == false }
    true
  end

  def validate_cells
    (1..size).each { |index| return false if validate_cell(index) == false }
    true
  end

  private

  def parse_input(input)
    input = input.split(';')
    @size = input[0].to_i
    @board = input[1].split(',').map(&:to_i).each_slice(@size).to_a
  end

  def init_cells
    @cells = []
    divider = Math.sqrt(@size)
    @cells = (0..size - 1).select { |i| i % divider == 0 }.repeated_permutation(2).to_a
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

##### CODEEVAL INPUT #####

File.open(ARGV[0]).each_line do |line|
  puts SudokuValidator.new(line).validate
end

##### TESTS #####

describe SudokuValidator do
  before do
    @test_board1 = SudokuValidator.new('4;1,4,2,3,2,3,1,4,4,2,3,1,3,1,4,2')
    @test_board2 = SudokuValidator.new('4;2,1,3,2,3,2,1,4,1,4,2,3,2,3,4,1')
  end
  
  it 'should parse input numbers' do
    expect(@test_board1.board).to eq [[1, 4, 2, 3], [2, 3, 1, 4], [4, 2, 3, 1], [3, 1, 4, 2]]
    expect(@test_board1.cells).to eq [[0, 0], [0, 2], [2, 0], [2, 2]]
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
        expect(@test_board1.validate_columns).to be_truthy
        expect(@test_board2.validate_columns).to be_falsey
      end
    end
    
    context 'rows' do
      it 'all' do
        expect(@test_board1.validate_rows).to be_truthy
        expect(@test_board2.validate_rows).to be_falsey
      end
    end
    
    context 'cells' do
      it 'all' do
        expect(@test_board1.validate_cells).to be_truthy
        expect(@test_board2.validate_cells).to be_falsey
      end
    end

    it 'entire board' do
      expect(@test_board1.validate).to eq 'True'
      expect(@test_board2.validate).to eq 'False'
    end
  end
end
