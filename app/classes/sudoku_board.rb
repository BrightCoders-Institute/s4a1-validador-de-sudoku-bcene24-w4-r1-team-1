# frozen_string_literal: true

require_relative '../modules/sudoku_generator'
require_relative '../modules/sudoku_validator'
require_relative '../modules/sudoku_solver'

# The SudokuBoard class is responsible for the Sudoku
# boards generation, validations and solutions.
class SudokuBoard
  include SudokuSolver

  SPACE_CHARACTER = '-'

  def initialize(sudoku_board = nil)
    @board_status = 'unsolved'
    unless sudoku_board.is_a?(Array)
      puts "Warning: The provided Sudoku board is invalid. Generating a random board.\n"
      @sudoku_board = SudokuGenerator.generate_sudoku_board
      return
    end

    unless sudoku_board.length == 9 && sudoku_board.all? { |row| row.length == 9 }
      raise ArgumentError, 'Invalid board size'
    end

    @sudoku_board = sudoku_board
  end

  private

  def print_board_value(value, column_index)
    print "#{value.zero? ? SPACE_CHARACTER : value} "
    print '| ' if ((column_index + 1) % 3).zero?
  end

  def print_board_row(row, row_index)
    print '| '
    row.each_with_index { |value, column_index| print_board_value(value, column_index) }
    puts ((row_index + 1) % 3).zero? ? "\n+-------+-------+-------+" : ''
  end

  public

  def solve_board
    results = SudokuSolver.solve_sudoku_board(@sudoku_board)
    raise HTTParty::Error, 'The Sudoku solution request was not successful' unless results.success?

    @board_status = results['status']
    @sudoku_board = results['solution']
  end

  def board_is_valid?
    SudokuValidator.sudoku_board_is_valid?(@sudoku_board)
  end

  def print_board_validity
    puts "The Sudoku board is #{board_is_valid? ? '' : 'in'}valid."
  end

  def print_sudoku_board
    puts "(#{@board_status.capitalize} Sudoku board)"
    puts '+-------+-------+-------+'
    @sudoku_board.each_with_index { |row, row_index| print_board_row(row, row_index) }
  end

  def generate_general_sudoku_output
    print_sudoku_board
    print_board_validity
    puts ''

    solve_board
    print_sudoku_board
    puts ''
  end
end
