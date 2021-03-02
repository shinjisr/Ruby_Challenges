=begin
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

Example 1:

Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
=end

def two_sum(nums, target)
  hash = {}
  nums.each_with_index { |num, idx| hash[num] = idx }
  nums.each_with_index do |num, idx|
    diff = target - num
    return [hash[diff], idx] if hash[diff] && hash[diff] != idx
  end
end

def two_sum2(nums, target)
  dict = {}
  nums.each_with_index do |num, idx|
    return [dict[target - num], idx] if dict[target - num]

    dict[num] = idx
  end
end

def test_res(method, test_case, target)
  p send(method, test_case, target)
end

# test_res(:two_sum2, [2, 7, 11, 15], 9) # => [0, 1]
# test_res(:two_sum2, [3, 2, 4], 6)      # => [1, 2]
# test_res(:two_sum2, [3, 3], 6)         # => [0, 1]

require 'benchmark'

def performance_test(*methods)
  n = 1_000_000
  test_case, target = [2,7,11,15], 9
  Benchmark.bm do |x|
    methods.each do |method|
      x.report(method) { n.times { send(method, test_case, target) } }
    end
  end
end

performance_test(:two_sum, :two_sum2)

=begin
       user     system      total        real
two_sum  1.428509   0.017298   1.445807 (  1.482629)
two_sum2  0.921731   0.008280   0.930011 (  0.952275)
=end
