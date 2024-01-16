# frozen_string_literal: false

require 'matrix'

# The Sudoku class is responsible for the sudoku validations
class Sudoku
  attr_reader :sudoku_matrix

  def initialize
    # Create an empty Sudoku board.
    @sudoku_matrix = Matrix.build(9) { 0 }
  end

  def validate; end

  def generate_list_without_empty_values(list)
    # List es columna o fila
    list.reject(&:zero?)
  end

  def list_values_are_unique?(list)
    list_with_values = generate_list_without_empty_values(list)
    list_with_values.uniq.size == list_with_values.size
  end

  def values_list_is_valid?(list)
    list.all? { |n| (0..10).include?(n) }
  end

  def board_values_list_is_valid?(list)
    values_list_is_valid?(list) && list_values_are_unique?(list)
  end

  def sudoku_board_is_valid?(sudoku_board)
    matrix_board = Matrix.rows(sudoku_board)

    matrix_board.row_vectors.all? { |row| board_values_list_is_valid?(row) } &&
      matrix_board.column_vectors.all? { |column| board_values_list_is_valid?(column) }
  end

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

  #   def row(index)
  #     @matrix[index]
  #   end

  #   def column(index)
  #     col = []
  #     3.times { |i| col.push(row(i)[index]) }
  #     col
  #   end

  #   def display
  #         @soduku_matrix.reverse.each_with_index do |row, i|
  #           row.each_with_index do |cell, j|
  #             print cell
  #             # ascii 179
  #             print '│' unless j == 2
  #           end
  #           print "\n"
  #           # ascii 196 && 197
  #           print "─┼─┼─\n" unless i == 2
  #         end
  #     print sudoku_matrix
  #   end
end

tablero_true = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 0, 7, 9]
]

tablero_false = [
  [5, 3, 0, 0, 7, 0, 0, 0, 0],
  [6, 0, 0, 1, 9, 5, 0, 0, 0],
  [0, 9, 8, 0, 0, 0, 0, 6, 0],
  [8, 0, 0, 0, 6, 0, 0, 0, 3],
  [4, 0, 0, 8, 0, 3, 0, 0, 1],
  [7, 0, 0, 0, 2, 0, 0, 0, 6],
  [0, 6, 0, 0, 0, 0, 2, 8, 0],
  [0, 0, 0, 4, 1, 9, 0, 0, 5],
  [0, 0, 0, 0, 8, 0, 9, 7, 9] # El último 9 es inválido (repetido)
]

m = Sudoku.new
puts m.sudoku_board_is_valid?(tablero_true)
puts m.sudoku_board_is_valid?(tablero_false)
