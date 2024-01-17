# frozen_string_literal: false

require 'json'
require_relative './classes/sudoku_board'

begin
  json_file = File.read(File.join(File.dirname(__FILE__), 'sudoku_boards.json'))

  JSON.parse(json_file)['boards'].each_with_index do |board, index|
    puts "||-------Board no. #{format('%02d', index + 1)}-------||"
    sudoku_board = SudokuBoard.new(board)
    sudoku_board.generate_general_sudoku_output
    puts ''
  end
rescue StandardError => e
  puts e.full_message
end
