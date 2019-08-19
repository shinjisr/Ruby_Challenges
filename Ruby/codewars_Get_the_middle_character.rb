# 7 kyu
# Get the Middle Character
# https://www.codewars.com/kata/get-the-middle-character/train/ruby

# You are going to be given a word. Your job is to return the middle character of the word. If the word's length is odd, return the middle character. If the word's length is even, return the middle 2 characters.


def get_middle(s)
  (s.size.odd?) ? s[(s.size / 2)] : s[(s.size - 1) / 2, 2]
end

p get_middle("test") # "es"
p get_middle("testing") # "t"
p get_middle("middle") # "dd"
p get_middle("A") # "A"
p get_middle("of") # "of"

# The Best Practices:
# The most clever answer:
def get_middle(s)
  s[(s.size - 1) / 2..s.size / 2] # s.size / 2 will round down == .floor
end