require 'pry'
require_relative 'spec_helper'
require_relative '../calculator.rb'

describe 'work' do
  overlap = [
    [[5, 15], [9, 4], [7, 11], [17, 6]],
    [[7, 11], [17, 6], [5, 15], [9, 4]],
    [[1, 5], [8, 1], [8, 9], [15, 5]],
    [[8, 9], [15, 5], [1, 5], [8, 1]],
    [[3, 12], [13, 6], [4, 11], [12, 7]],
    [[4, 11], [12, 7], [3, 12], [13, 6]],
    [[10,10],	[20,5], [5,8],	[21,4]],
    [[5,8],	[21,4], [10,10],	[20,5]]
  ]
  # R1	[5,15]	[9,4]
  # R2	[7,11]	[17,6]
  # R1	[7,11]	[17,6]
  # R2	[5,15]	[9,4]
  #
  # R1	[1,5]	[8,1]
  # R2	[8,9]	[15,5]
  # R1	[8,9]	[15,5]
  # R2	[1,5]	[8,1]
  #
  # R1	[3,12]	[13,6]
  # R2	[4,11]	[12,7]
  # R1	[4,11]	[12,7]
  # R2	[3,12]	[13,6]
  #
  # R1	[10,10]	[20,5]
  # R2	[5,8]	[21,4]
  # R1	[5,8]	[21,4]
  # R2	[10,10]	[20,5]
  #
  # Expected overlap

  no_overlap = [

    [[1, 9], [7, 4], [12, 16], [17, 6]],
    [[12, 16], [17, 6], [1, 9], [7, 4]],
    [[5, 9], [12, 5], [9, 15], [15, 10]],
    [[9, 15], [15, 10], [5, 9], [12, 5]]
  ]

  # R1	[1,9]   [7,4]
  # R2	[12,16]	[17,6]
  # R1	[12,16]	[17,6]
  # R2	[1,9] 	[7,4]
  #
  # R1	[5,9]	[12,5]
  # R2	[9,15]	[15,10]
  # R1	[9,15]	[15,10]
  # R2	[5,9]	[12,5]
  #
  # Expected no overlap

  overlap.each do |params|
    it 'squares should overlap' do
      expect(Calculator.call(params)).to be_truthy
    end
  end

  no_overlap.each do |params|
    it 'squares should no overlap' do
      expect(Calculator.call(params)).to be_falsey
    end
  end
end
