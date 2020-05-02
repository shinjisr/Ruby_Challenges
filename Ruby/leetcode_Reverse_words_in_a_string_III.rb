=begin
Given a string, you need to reverse the order of characters in each word within a sentence while still presvering whitespace and ininial word order.

Example 1:
Input: "let's take LeetCode contest"
Output: "s'teL ekat edoCteeL testnoc"
=end

def reverse_words(s)
  s.split(/ /).map(&:reverse).join(' ')
end

def reverse_words(s)
  s.gsub(/S+/, &:reverse)
end
