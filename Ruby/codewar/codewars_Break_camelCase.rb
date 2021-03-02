# 6 kyu
# Break camelCase
# https://www.codewars.com/kata/5208f99aee097e6552000148/train/ruby

#Complete the solution so that the function will break up camel casing, using a space between words.

def solution(str)
  strArr = []
  str.split('').each{|e| (e == e.upcase) ? strArr << " #{e}" : strArr << e}
  strArr.join
end


p solution('camelCasing') # 'camel Casing'
p solution('camelCasingTest') # 'camel Casing Test'

# The Best Practices:
def solution(string)
  # "\1" in this line means "first" matched group it self
  string.gsub /([A-Z])/, ' \1'
end
# The most clever answer:
def solution(string)
  string.gsub(/(?=[A-Z])/, ' ')
end

def solution(string)
  string.gsub(/([a-z])([A-Z])/, '\1 \2')
end

def solution(string)
  string.gsub(/[A-Z]/, ' \0')
end

def solution(string)
  string.split(/(?=[A-Z])/).join ' '
end