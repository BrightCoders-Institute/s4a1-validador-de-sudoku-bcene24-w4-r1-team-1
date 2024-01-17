# frozen_string_literal: false

require 'httparty'

# Module to solve an uncomplete Sudoku board.
module SudokuSolver
  private

  def encode_params(params)
    "#{URI.encode_www_form({ board: params }).gsub('+', '').gsub('&board=', '%2C').gsub('board=', 'board=%5B')}%5D"
  end

  public

  def solve_sudoku_board(sudoku_board)
    response = HTTParty.post(
      'https://sugoku.onrender.com/solve',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: encode_params(sudoku_board)
    )
    return 'Unsolvable Sudoku board' unless response['status'] == 'solved'

    response['solution']
  end
end
