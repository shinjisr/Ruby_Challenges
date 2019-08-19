# * 7 kyu Predict your age!
# My grandfather always predicted how old people would get, and right before he passed away he revealed his secret!
# In honor of my grandfather's memory we will write a function using his formula!
# Take a list of ages when each of your great-grandparent died.
# Multiply each number by itself.
# Add them all together.
# Take the square root of the result.
# Divide by two.




# 為何使用 Ruby 2.5 的 Integer.sqrt 取代 Math.sqrt ?
# https://medium.com/@atul9/using-ruby-2-5s-new-integer-sqrt-cd9cb5955e12

# def predict_age(*args)
#   sum = args.map{|x| x * x}.reduce(:+)
#   # Math.sqrt(sum).floor / 2 # needs to be floor 
#   Integer.sqrt(sum) / 2  
# end

# refactored 1
def predict_age(*args)
  # Integer.sqrt(args.map{|x| x *= x}.reduce(:+)) / 2

  # refactored 2
  Integer.sqrt(args.map(&:abs2).sum) / 2
end

# The Best Practices:
# def predict_age(*args)
#   (args.map(&:abs2).sum ** 0.5 / 2).to_i
# end

# The most clever answer:

p predict_age(65,60,75,55,60,63,64,45) # 86
p predict_age(32,54,76,65,34,63,64,45) # 79