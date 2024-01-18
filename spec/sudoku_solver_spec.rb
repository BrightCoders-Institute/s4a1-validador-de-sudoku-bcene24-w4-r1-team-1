# frozen_string_literal: true

# sudoku_solver_spec.rb

require '../app/classes/sudoku_board'
require './modules/test_sudoku_boards'

RSpec.describe SudokuBoard do
  describe 'sudoku_board_is_valid?' do
    it 'it solves when given a valid Sudoku board' do
      sudoku_board = SudokuBoard.new(TestSudokuBoards::VALID_BOARD)
      expect(sudoku_board.instance_variable_get(:@board_status)).to eq 'unsolved'
      sudoku_board.solve_board
      expect(sudoku_board.instance_variable_get(:@board_status)).to eq 'solved'
    end

    it 'it marks as unsolvable when given an invalid Sudoku board' do
      sudoku_board = SudokuBoard.new(TestSudokuBoards::INVALID_BOARD)
      expect(sudoku_board.instance_variable_get(:@board_status)).to eq 'unsolved'
      sudoku_board.solve_board
      expect(sudoku_board.instance_variable_get(:@board_status)).to eq('unsolvable').or eq('broken')
    end

    it 'returns false when given invalid Sudoku boards' do
      TestSudokuBoards::INVALID_BOARDS_COMBINATION.each do |board|
        sudoku_board = SudokuBoard.new(board)
        expect(sudoku_board.instance_variable_get(:@board_status)).to eq 'unsolved'
      end
    end
  end
end
