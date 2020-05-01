# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

# Example:

# Input: 38
# Output: 2
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.

def add_digits(num)
  if num > 9
    result = num.to_s.chars.map(&:to_i).reduce(:+)
    add_digits(result)
  else
    p num
  end
end

def add_digits(num)
  p num && (num % 9 || 9)
end

add_digits(101) # shoud be 2
add_digits(38)  # shoud be 2
add_digits(22)  # shoud be 4
