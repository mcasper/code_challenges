# Find the largest difference between elements in a subsequence of length N in an array. For example, with the array:
#   [6, 9, 4, 7, 4, 1], the subsequences of length 3 are
#   [6, 9, 4],
#   [9, 4, 7],
#   [4, 7, 4],
#   [7, 4, 1]
#
# The largest difference between elements in a subsequence is in the last one, the max number being 7 and the min being 1. The difference is 6.
#
#   Your code must pass this test, AND run the benchmark in under 5 seconds. 

require "pry"

def find_max_difference(old_array, old_subset)
  array = old_array
  subset = old_subset - 1
  i = 0
  max_difference = 0
  offset = subset
  while (i + subset) < array.length
    sub_array = array[i..offset].sort
    difference = sub_array[subset] - sub_array[0]
    max_difference = difference if difference > max_difference
    i += 1
    offset += 1
  end

  max_difference
end

describe "max_difference" do
  it "will find" do
    expect(find_max_difference([6, 9, 4], 3)).to eq(5)
    expect(find_max_difference([6, 9, 4, 7, 4, 1], 3)).to eq(6)
    expect(find_max_difference([6, 9, 4, 7, 4, 1, 2], 3)).to eq(6)
  end
end

# find_max_difference takes two arguments, the array and the subsequence length

require "benchmark"

Benchmark.bm do |x|
  numbers = (0..10000000).to_a.shuffle
  x.report("Big Size") do
    find_max_difference(numbers, 3)
  end
end

