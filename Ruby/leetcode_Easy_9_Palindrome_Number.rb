=begin
Given an integer x, return true if x is palindrome integer.

An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.

Example 1:

Input: x = 121
Output: true

Example 2:

Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

Constraints:

-231 <= x <= 231 - 1
=end

# my anwser:
def is_palindrome1(x)
  return false if x < 0
  return true if x < 10
  x == x.to_s.reverse.to_i
end

def is_palindrome2(x)
  return false if x < 0
  return true if x < 10
  x.to_s == x.to_s.reverse
end

# Without using reverse
# @param {Integer} x
# @return {Boolean}
def is_palindrome3(x)
  return false if x < 0
  return true if x < 10

  reverse = 0
  curr = x
  while curr > 0
      last_digit = curr % 10
      reverse = (reverse * 10) + last_digit
      curr /= 10
  end
  reverse == x
end

require 'benchmark'
# loop_times = 1000
# res = Benchmark.measure do
  # loop_times.times do
    # is_palindrome(121)
  # end
# end.total

# puts "Benchmark"
# puts res

n = 1_000_000
test_case = 121
Benchmark.bm do |x|
  x.report('is_palindrome1') { n.times { is_palindrome1(test_case) } }
  x.report('is_palindrome2') { n.times { is_palindrome2(test_case) } }
  x.report('is_palindrome3') { n.times { is_palindrome3(test_case) } }
end

=begin
       user     system      total        real
is_palindrome1  0.364331   0.003511   0.367842 (  0.373231)
is_palindrome2  0.402533   0.003491   0.406024 (  0.411346)
is_palindrome3  0.261658   0.002188   0.263846 (  0.266857)
=end
