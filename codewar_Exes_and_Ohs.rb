# 7 kyu Exes and Ohs

# def XO(str)
#   str.chars.select{|i| (i == 'x') || (i == 'X')}.size == str.chars.select{|i| (i == 'O') || (i == 'o')}.size
# end


# refactor
# def XO(str)
#   p str.chars.select{|i| i.upcase == 'X'}.size == str.chars.select{|i| i.upcase == 'O'}.size
# end

# refactor2
# def XO(str)
#   p str.chars.count{|i| i.upcase == 'X'} == str.chars.count{|i| i.upcase == 'O'}
# end

# refactor3 & best practice & most clever
# def XO(str)
#   p str.downcase.count('x') == str.downcase.count('o')
# end

# another way to do it by regular expression, seems good. 
def XO(str)
  str.count('/x|X/') == str.count('/o|O/')
end

XO('xo') # true
XO('XO') # true
XO('xo0') # true
XO('xxxoo') # false
XO("xxOo") # true

