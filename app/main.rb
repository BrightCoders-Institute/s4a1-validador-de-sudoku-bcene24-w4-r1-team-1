# frozen_string_literal: false

require_relative './classes/sudoku'

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

sudoku_juego = [
  [5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 9]
]

matriz_extra = [
  [0, 0, 0, 0, 0, 0, 8, 0, 0],
  [0, 0, 4, 0, 0, 8, 0, 0, 9],
  [0, 7, 0, 0, 0, 0, 0, 0, 5],
  [0, 1, 0, 0, 7, 5, 0, 0, 8],
  [0, 5, 6, 0, 9, 1, 3, 0, 0],
  [7, 8, 0, 0, 0, 0, 0, 0, 0],
  [0, 2, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 9, 3, 0, 0, 1, 0],
  [0, 0, 5, 7, 0, 0, 4, 0, 3]
]

begin
  m = Sudoku.new(tablero_true)
  puts m.sudoku_board_is_valid?(tablero_true)
  puts m.solve_sudoku_board(tablero_true).inspect

  puts m.sudoku_board_is_valid?(tablero_false)
  puts m.solve_sudoku_board(tablero_false).inspect

  puts m.sudoku_board_is_valid?(sudoku_juego)
  puts m.solve_sudoku_board(sudoku_juego).inspect

  puts m.sudoku_board_is_valid?(matriz_extra)
  puts m.solve_sudoku_board(matriz_extra).inspect
rescue StandardError => e
  puts e.full_message
end
