require 'rspec'
require_relative '161'

class String
  def unindent
    gsub /^#{self[/\A\s*/]}/, ''
  end
end

describe GameOfLife do
  let(:game_of_life) { GameOfLife.new(test_input) }
  let(:test_input) do
    <<-STR.unindent.gsub(/\n$/, '')
    ***
    **.
    ...
    STR
  end

  it 'should parse the input' do
    expect(game_of_life.board).to eq test_input
  end

  it 'should assign cells to proper indices' do
    expect(
      [
        game_of_life.board[0],
        game_of_life.board[1],
        game_of_life.board[2],
        game_of_life.board[4],
        game_of_life.board[5],
        game_of_life.board[6],
        game_of_life.board[8],
        game_of_life.board[9],
        game_of_life.board[10]
      ]
    ).to eq %w(* * * * * . . . .)
  end

  it 'should fetch neighbors of a cell' do
    expect(game_of_life.neighbors(0, 0)).to eq [nil, nil, nil, nil, '*', nil, '*', '*']
    expect(game_of_life.neighbors(2, 0)).to eq [nil, nil, nil, '*', nil, '*', '.', nil]
    expect(game_of_life.neighbors(1, 1)).to eq ['*', '*', '*', '*', '.', '.', '.', '.']
    expect(game_of_life.neighbors(2, 2)).to eq ['*', '.', nil, '.', nil, nil, nil, nil]
  end

  context 'cell' do 
    it 'any live cell with fewer than two live neighbors dies, as if caused by under-population.' do
      game_of_life = GameOfLife.new(
        <<-STR.unindent.gsub(/\n$/, '')
        ...
        .*.
        ..*
        STR
      ).iterate!

      expect(game_of_life.board).to eq(
        <<-STR.unindent.gsub(/\n$/, '')
        ...
        ...
        ...
        STR
      )
    end

    it 'any live cell with two or three live neighbors lives on to the next generation' do
      game_of_life = GameOfLife.new(
        <<-STR.unindent.gsub(/\n$/, '')
        **.
        **.
        ...
        STR
      ).iterate!

      expect(game_of_life.board).to eq(
        <<-STR.unindent.gsub(/\n$/, '')
        **.
        **.
        ...
        STR
      )
    end

    it 'any live cell with more than three live neighbors dies, as if by overcrowding' do
      game_of_life = GameOfLife.new(
        <<-STR.unindent.gsub(/\n$/, '')
        ***
        **.
        ...
        STR
      ).iterate!
      
      expect(game_of_life.board).to eq(
        <<-STR.unindent.gsub(/\n$/, '')
        *.*
        *.*
        ...
        STR
      )
    end

    it 'any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction' do
      game_of_life = GameOfLife.new(
        <<-STR.unindent.gsub(/\n$/, '')
        **.
        *..
        ...
        STR
      ).iterate!

      expect(game_of_life.board).to eq(
        <<-STR.unindent.gsub(/\n$/, '')
        **.
        **.
        ...
        STR
      )
    end
  end
end
