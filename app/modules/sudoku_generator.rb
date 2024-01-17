# frozen_string_literal: true

require 'httparty'

# Module to generate a Sudoku board.
module SudokuGenerator
  API_URL = 'https://sugoku.onrender.com/board?difficulty=random'

  def self.generate_sudoku_board
    response = HTTParty.get(API_URL)
    raise HTTParty::Error, 'The Sudoku board generation request was not successful' unless response.success?

    response['board']
  end
end
