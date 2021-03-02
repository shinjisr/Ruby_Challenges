# 6 kyu +1 Array
# Given an array of integers of any length, return an array that has 1 added to the value represented by the array.

# the array can't be empty
# only non-negative, single digit integers are allowed
# Return nil (or your language's equivalent) for invalid inputs.

# Examples
# For example the array [2, 3, 9] equals 239, adding one would return the array [2, 4, 0].

# [4, 3, 2, 5] would return [4, 3, 2, 6]

# My answer
# def up_array(arr)
#   p "Test arr = #{arr}"
#   return nil if arr.empty?
#   arr.each { |ele| return nil if ele.negative? || ele > 9 }
#   (arr.join.to_i + 1).to_s.chars.map(&:to_i)
# end

# The Best Practices:
# def up_array(arr)
#   p "Test arr = #{arr}"
#   return nil if arr.empty? || arr.any? { |e| e.negative? || e > 9 }
#   arr.join.next.chars.map(&:to_i)
# end

# The most clever answer:
def up_array(arr)
  p "Test arr = #{arr}"
  arr.join.next.chars.map(&:to_i) if arr.all? { |e| e.between?(0, 9) } && !arr.empty?
end

# up_array([1, -9])
test_arr = [1, -9]
p up_array(test_arr)
test_arr = [1, 2]
p up_array(test_arr)
test_arr = [4, 3, 2, 5]
p up_array(test_arr)
test_arr = [4, 3, 2, 15]
p up_array(test_arr)