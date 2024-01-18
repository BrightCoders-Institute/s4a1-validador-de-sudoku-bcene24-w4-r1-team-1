# frozen_string_literal: true

# sudoku_validator_lists_spec.rb

require '../app/modules/sudoku_validator'

RSpec.describe SudokuValidator do
  describe '.list_values_are_unique?' do
    it 'returns true when all values are unique' do
      list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(SudokuValidator.send(:list_values_are_unique?, list)).to be true
    end

    it 'returns false when there are duplicate values' do
      list = [1, 2, 3, 4, 5, 6, 7, 8, 8]
      expect(SudokuValidator.send(:list_values_are_unique?, list)).to be false
    end
  end

  describe '.values_list_is_valid?' do
    it 'returns true when all values are between 0 and 9' do
      list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(SudokuValidator.send(:values_list_is_valid?, list)).to be true
    end

    it 'returns false when there is a value greater than 9' do
      list = [1, 2, 3, 10, 5, 6, 7, 8, 9]
      expect(SudokuValidator.send(:values_list_is_valid?, list)).to be false
    end
  end
end
