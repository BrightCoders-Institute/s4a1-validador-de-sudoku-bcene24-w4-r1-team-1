# frozen_string_literal: false

require_relative '../modules/sudoku_generator'
require_relative '../modules/sudoku_validator'
require_relative '../modules/sudoku_solver'

# The Sudoku class is responsible for the sudoku validations
class Sudoku
  include SudokuGenerator
  include SudokuValidator
  include SudokuSolver

  attr_reader :sudoku_matrix

  def initialize
    # Create an empty Sudoku board.
    @sudoku_matrix = Matrix.build(9) { 0 }
  end

  def validate; end

  def analice_rows(_matriz)
    soduku_matrix.each do |fila|
      fila.each do |_elemento|
        pri
      end
    end
  end

  def analice_columns(_matriz)
    9.times do |i|
      9.times do |j|
        print "#{sudoku_matrix[j][i]}"
      end
    end
  end
end
