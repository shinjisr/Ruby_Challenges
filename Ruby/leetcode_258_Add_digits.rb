# Given a non-negative integer num, repeatedly add all its digits until the result has only one digit.

# Example:

# Input: 38
# Output: 2
# Explanation: The process is like: 3 + 8 = 11, 1 + 1 = 2. Since 2 has only one digit, return it.

def add_digits1(num)
  while num > 9
    num = num.to_s.chars.map(&:to_i).reduce(:+)
  end
  num
end

def add_digits2(num)
  return num if num < 10
  num % 9
end

def add_digits3(num)
  while num > 9
    next_digit = 0

    while num > 0
      next_digit += num % 10
      num /= 10
    end

    num = next_digit # if num greater than 9, then go to the next loop 
  end

  num
end

def test_res(method)
  test_case = [101, 38, 22]

  test_case.each do |e|
    puts send(method, e)
  end
end

# test_res(:add_digits1)

# p add_digits3(101) # shoud be 2
# p add_digits3(38)  # shoud be 2
# p add_digits3(22)  # shoud be 4

require 'benchmark'

def performance_test(*methods)
  n = 1_000_000
  p test_case = rand(0..200)
  Benchmark.bm do |x|
    methods.each do |method|
      x.report(method) { n.times { send(method, test_case) } }
    end
  end
end

performance_test(:add_digits1, :add_digits2, :add_digits3)
