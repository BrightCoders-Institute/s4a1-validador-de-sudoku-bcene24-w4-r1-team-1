# frozen_string_literal: true

# Module to generate invalid Sudoku boards.
module InvalidSudokuBoardsGenerator
  DEFAULT_BOARD = [[5, 3, 4, 6, 7, 8, 9, 1, 2], [6, 7, 2, 1, 9, 5, 3, 4, 8], [1, 9, 8, 3, 4, 2, 5, 6, 7],
                   [8, 5, 9, 7, 6, 1, 4, 2, 3], [4, 2, 6, 8, 5, 3, 7, 9, 1], [7, 1, 3, 9, 2, 4, 8, 5, 6],
                   [9, 6, 1, 5, 3, 7, 2, 8, 4], [2, 8, 7, 4, 1, 9, 6, 3, 5], [3, 4, 5, 2, 8, 6, 1, 7, 9]].freeze

  private_class_method def self.transform_to_invalid_board(row_index, column_index, value)
    invalid_board = DEFAULT_BOARD.collect(&:dup)
    invalid_board[row_index][column_index] = value
    invalid_board
  end

  def self.generate_invalid_sudoku_boards
    test_values_list = (1..9).to_a
    invalid_boards_list = []

    test_values_list.each do |value|
      DEFAULT_BOARD.each_with_index do |row, row_index|
        row.each_with_index do |column, column_index|
          invalid_boards_list.push(transform_to_invalid_board(row_index, column_index, value)) unless value == column
        end
      end
    end
    invalid_boards_list
  end
end
