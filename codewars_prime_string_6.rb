# 6 kyu, but very hard...
# Simple Fun #116: Prime String

# The string is called prime if it cannot be constructed by concatenating some (more than one) equal strings together.
# For example, "abac" is prime, but "xyxy" is not("xyxy"="xy"+"xy").
# Given a string determine if it is prime or not.

# nput/Output// [input] string s
# string containing only lowercase English letters
# [output] a boolean value
# true if the string is prime, false otherwise

def prime_string(s)
  (s + s).index(s, 1) == s.size
end

p primeString("asdf") # should be true
p primeString("abac") # should be true
p primeString("qiuefgqiuefgqiuefg") # should be false
p primeString("zkvjhuj") # should be true