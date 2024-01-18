# frozen_string_literal: false

require 'matrix'

# Module to validate a Sudoku board.
module SudokuValidator
  private_class_method def self.generate_list_without_empty_values(list)
    # List es columna o fila
    list.reject(&:zero?)
  end

  private_class_method def self.list_values_are_unique?(list)
    list_with_values = generate_list_without_empty_values(list)
    list_with_values.uniq.size == list_with_values.size
  end

  private_class_method def self.values_list_is_valid?(list)
    list.all? { |n| (0..9).include?(n) }
  end

  private_class_method def self.board_values_list_is_valid?(list)
    values_list_is_valid?(list) && list_values_are_unique?(list)
  end

  private_class_method def self.sudoku_box_is_valid?(sudoku_board, box_row, column_row)
    board_values_list_is_valid?(sudoku_board.minor(box_row, column_row).to_a.flatten)
  end

  def self.sudoku_boxes_are_valid?(sudoku_board)
    3.times do |box_row|
      3.times do |column_row|
        return false unless sudoku_box_is_valid?(sudoku_board,
                                                 (3 * box_row)..(2 + 3 * box_row),
                                                 (3 * column_row)..(2 + 3 * column_row))
      end
    end
    true
  end

  def self.sudoku_board_is_valid?(sudoku_board)
    matrix_board = Matrix.rows(sudoku_board)

    matrix_board.row_vectors.all? { |row| board_values_list_is_valid?(row) } &&
      matrix_board.column_vectors.all? { |column| board_values_list_is_valid?(column) } &&
      sudoku_boxes_are_valid?(matrix_board)
  end
end
