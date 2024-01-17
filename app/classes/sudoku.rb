# frozen_string_literal: false

require_relative '../modules/sudoku_generator'
require_relative '../modules/sudoku_validator'
require_relative '../modules/sudoku_solver'

# The Sudoku class is responsible for the sudoku validations
class Sudoku
  include SudokuGenerator
  include SudokuValidator
  include SudokuSolver

  def initialize(sudoku_board = nil)
    if sudoku_board.nil?
      @sudoku_board = generate_sudoku_board
      return
    end

    throw TypeError, 'Sudoku board datatype must be a Array' unless sudoku_board.is_a?(Array)

    unless sudoku_board.length == 9 && sudoku_board.all? { |row| row.length == 9 }
      throw ArgumentError, 'Invalid board size'
    end
    @sudoku_board = sudoku_board
  end

  def print_board
    @sudoku_board.each { |row| row.each { |column| puts column } }
  end
end
