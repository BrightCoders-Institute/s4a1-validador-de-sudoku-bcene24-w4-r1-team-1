# frozen_string_literal: true

# sudoku_validator_boxes_spec.rb

require 'matrix'
require '../app/modules/sudoku_validator'
require './modules/test_sudoku_boards'

RSpec.describe SudokuValidator do
  describe 'sudoku_boxes_are_valid?' do
    it 'returns true when given a valid Sudoku board' do
      expect(SudokuValidator.send(:sudoku_boxes_are_valid?, Matrix.rows(TestSudokuBoards::VALID_BOARD))).to be true
    end

    it 'returns false when given an invalid Sudoku board' do
      expect(SudokuValidator.send(:sudoku_boxes_are_valid?, Matrix.rows(TestSudokuBoards::INVALID_BOARD))).to be false
    end

    it 'returns false when given invalid Sudoku boards' do
      TestSudokuBoards::INVALID_BOARDS_COMBINATION.each do |board|
        expect(SudokuValidator.send(:sudoku_boxes_are_valid?, Matrix.rows(board))).to be false
      end
    end
  end
end
