# The difference between Iteration and Recursion.
# 2021-01-18 18:59:41 +0800

input = ARGV[0].to_i
times = input

# =============================
# Iteration （疊代）
# =============================

def factorial(n)
  ans = 1

  (1..n).each do |i|
    ans = ans * i
  end

  ans
end

# The oneliner solution
def factorial(n)
  (1..n).reduce(&:*)
end

result = factorial(times)

puts "The iteration result of factorial(#{times}) is: #{result}"

# =============================
# Recursion （遞迴）
# =============================

def factorial2(n)
  return 1 if n == 0

  n * factorial2(n - 1)
end

result = factorial2(times)

puts "The recursion result of factorial2(#{times}) is: #{result}"
