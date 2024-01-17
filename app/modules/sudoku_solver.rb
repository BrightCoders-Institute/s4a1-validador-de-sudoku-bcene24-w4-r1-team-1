# frozen_string_literal: true

require 'httparty'

# Module to solve an uncomplete Sudoku board.
module SudokuSolver
  API_URL = 'https://sugoku.onrender.com/solve'

  private_class_method def self.encode_params(params)
    "#{URI.encode_www_form({ board: params }).gsub('+', '').gsub('&board=', '%2C').gsub('board=', 'board=%5B')}%5D"
  end

  def self.solve_sudoku_board(sudoku_board)
    HTTParty.post(
      API_URL,
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: encode_params(sudoku_board)
    )
  end
end
