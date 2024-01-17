# frozen_string_literal: true

require 'httparty'

# Module to generate a Sudoku board.
module SudokuGenerator
  API_URL = 'https://sugoku.onrender.com/board?difficulty=random'

  def generate_sudoku_board
    HTTParty.get(API_URL)['board']
  end
end
