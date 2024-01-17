# frozen_string_literal: false

require 'httparty'

# Module to solve an uncomplete Sudoku board.
module SudokuSolver
  private

  def encode_board(board)
    board.each.with_index.reduce('') do |result, (row, i)|
      "#{result}%5B#{URI.encode_www_form_component(row)}%5D#{i == board.length - 1 ? '' : '%2C'}"
    end
  end

  def encode_params(params)
    params.map { |key, value| "#{key}=#{encode_board(value).gsub('+', '')}" }.join('&')
  end

  public

  def solve_sudoku_board(sudoku_board)
    puts encode_params({ 'board' => sudoku_board })
    HTTParty.post(
      'https://sugoku.onrender.com/solve',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: encode_params({ 'board' => sudoku_board })
    )
  end
end
