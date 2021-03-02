# 7. Reverse Integer
# Given a 32-bit signed integer, reverse digits of an integer.
# Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−2^31,  2^31 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

# Example:
# Input: 123
# Output: 321

# Input: -123
# Output: -321

# Input: 1534236469
# Output: 9646324351

# My solution:
def reverse(x)
  reverse = x.to_s.reverse.to_i
  reverse = reverse * -1 if x < 0
  reverse.bit_length > 31 ? 0 : reverse
end
