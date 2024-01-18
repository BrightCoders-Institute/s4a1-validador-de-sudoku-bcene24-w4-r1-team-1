# frozen_string_literal: true

# sudoku_validator_empty_lists_spec.rb

require '../app/modules/sudoku_validator'

RSpec.describe SudokuValidator do
  describe '.generate_list_without_empty_values' do
    it 'removes empty values from the list' do
      list = [1, 0, 3, 0, 5, 0, 7, 8, 0]
      expect(SudokuValidator.send(:generate_list_without_empty_values, list)).to eq([1, 3, 5, 7, 8])
    end

    it 'handles lists with no empty values' do
      list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(SudokuValidator.send(:generate_list_without_empty_values, list)).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
