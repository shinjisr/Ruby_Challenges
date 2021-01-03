# ================================
# To print a tree made with number
# ================================
#
# Example:
# 1
# 22
# 333
# 4444
# 55555
# ================================
num = 0

while num != 6
  j = 0

  while j != num
    print num
    j += 1
  end

  puts ''
  num += 1
end

# ================================
# loop do
# ================================
def loop_do(count)
  # starting of do..while loop
  loop do
    puts 'looping'
    val = count
    val -= 1

    if val == 7
      break # ending of ruby do..while loop
    end
  end
end

# ================================
# for loop
# ================================

def for_loop(count)
  return unelss count.is_a? Integer
  str = 'Hello world'

  # using for loop with the range
  for a in 1..count do
    puts str
  end
end

def for_loop2(count)
  return unelss count.is_a? Integer
  array = ['Apple', 'Bee', 'Cake']

  for i in arr do
    puts i
  end
end

# ================================
# until loop
# ================================

def until_loop(count)
  return unless count.is_a? Integer

  until count >= 11 do
    puts 'YOLO'
    count -= 1
  end
end
