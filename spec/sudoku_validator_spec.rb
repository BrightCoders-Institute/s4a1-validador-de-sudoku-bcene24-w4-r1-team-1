# frozen_string_literal: true

# sudoku_validator_spec.rb

require '../app/classes/sudoku_board'
require './modules/test_sudoku_boards'

RSpec.describe SudokuBoard do
  describe 'sudoku_board_is_valid?' do
    it 'returns true when given a valid Sudoku board' do
      expect(SudokuBoard.new(TestSudokuBoards::VALID_BOARD).board_is_valid?).to be true
    end

    it 'returns false when given an invalid Sudoku board' do
      expect(SudokuBoard.new(TestSudokuBoards::INVALID_BOARD).board_is_valid?).to be false
    end

    it 'returns false when given invalid Sudoku boards' do
      TestSudokuBoards::INVALID_BOARDS_COMBINATION.each do |board|
        expect(SudokuBoard.new(board).board_is_valid?).to be false
      end
    end
  end
end
