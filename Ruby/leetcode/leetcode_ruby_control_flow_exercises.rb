# 181220 LeetCode ruby practice:
# https://leetcode.com/explore/learn/card/become-a-web-developer/236/logic-control-flow-exercises/1329/
# EASY

# Return the middle character of a string. Return the middle two characters if the word is of even length,
# e.g., middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  # your code goes here
  # arr_str = str.chars
  if str.length % 2 == 0
    return str[str.length / 2] * 2
  elsif str.length % 2 == 1
    return str[str.length / 2]
  end
end

# Return the number of vowels in a string.
def num_vowels(str)
  vowels_count = 0
  vowels = ["a", "e", "i", "o", "u"]

  str_idx = 0
  while str_idx < str.length
    ch = str[str_idx]
    if vowels.include?(ch.downcase)
      vowels_count = vowels_count + 1
    end
    str_idx = str_idx + 1
  end
  vowels_count
  # return str.count('aeiouAEIOU') # an easy way to do this
end


# MEDIUM

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)

  # An easy way to solve this question whith regular expression.
  # return str.gsub(/[a-z]/, '')


  # new_str = ''
  # str_idx = 0
  # while str_idx < str.length
  #   ch = str[str_idx]
  #   new_str << ch if ch == ch.upcase
  #   str_idx += 1
  # end
  # new_str

  new_str = ''
  str.chars.each { |i| new_str << i if i == i.upcase }
  new_str
end

# Write a method that returns an array containing
# all the elements of the argument array in reverse order.
def my_reverse(arr)
  # arr_reverse = arr.reverse # an easy way to solve this
  # return arr_reverse
  reversed_arr = []
  i = 0
  while i < arr.length
    reversed_arr.unshift(arr[i]) # 迭代檢查陣列內的每個元素，並從前面加入到 reversed_arr
    i += 1
  end
  reversed_arr
end


# HARD

# Write your own version of the join method.
# Assume this method will always receive a
# separator as the second argument.
def my_join(arr, separator)
  # return arr.join("#{separator}") # an easy solution

  join = '' # set a empty string
  idx = 0 # set while loop
  while idx < arr.length
    join += arr[idx] # add element of arr to "join"

    if idx != arr.length - 1
      join += separator
    end

    idx += 1
  end
  join
end

# Return an array of integers from 1 to 30 (inclusive),
# except for each multiple of 3 replace the integer with "fizz",
# for each multiple of 5 replace the integer with "buzz",
# and for each multiple of both 3 and 5, replace the integer with "fizzbuzz".
def fizzbuzz
  arr = (1..30).to_a
  arr_fizzbuzz = []
  i = 0
  while i < arr.length
    if (arr[i] % 3).zero? && (arr[i] % 5).zero?
      arr_fizzbuzz << 'fizzbuzz'
    elsif (arr[i] % 5).zero?
      arr_fizzbuzz << 'buzz'
    elsif (arr[i] % 3).zero?
      arr_fizzbuzz << 'fizz'
    else
      arr_fizzbuzz << arr[i]
    end
    i += 1
  end
  return arr_fizzbuzz
  # arr.each do |x|
  #   if x % 3 == 0
  #     if x % 5 == 0
  #       arr_fizzbuzz << "fizzbuzz"
  #     else
  #       arr_fizzbuzz << "fizz"
  #     end
  #   elsif x % 5 == 0
  #     arr_fizzbuzz << "buzz"
  #   else
  #     arr_fizzbuzz << x
  #   end
  #   return arr_fizzbuzz
  # end
end

# DO NOT MODIFY CODE BELOW

$success_count = 0
$failure_count = 0

def deep_dup(arr)
  arr.inject([]) { |acc, el| el.is_a?(Array) ? acc << deep_dup(el) : acc << el }
end

def note_success(returned, invocation, expectation)
  puts "success: #{invocation} => #{expectation}"
  $success_count += 1
end

def note_failure(returned, invocation, expectation)
  puts "failure: #{invocation}: expected #{expectation}, returned #{returned}"
  $failure_count += 1
end

def format_args(args)
  o_args = deep_dup(args)
  o_args.map! do |arg|
    arg = prettify(arg)
    arg.class == Array ? arg.to_s : arg
  end
  o_args.join(', ')
end

def prettify(statement)
  case statement
  when Float
    statement.round(5)
  when String
    "\"#{statement}\""
  when NilClass
    "nil"
  else
    statement
  end
end

def equality_test(returned, invocation, expectation)
  if returned == expectation && returned.class == expectation.class
    note_success(returned, invocation, expectation)
  else
    note_failure(returned, invocation, expectation)
  end
end

def identity_test(returned, invocation, expectation, args)
  if returned.__id__ == args[0].__id__
    equality_test(returned, invocation, expectation)
  else
    puts "failure: #{invocation}: You did not mutate the original array!"
    $failure_count += 1
  end
end

def method_missing(method_name, *args)
  method_name = method_name.to_s
  expectation = args[-1]
  args = args[0...-1]
  if method_name.start_with?("test_")
    tested_method = method_name[5..-1]
    print_test(tested_method, args, expectation)
  else
    method_name = method_name.to_sym
    super
  end
end

def print_test(method_name, args, expectation)
  returned = self.send(method_name, *args)
  returned = prettify(returned)
  expectation = prettify(expectation)
  args_statement = format_args(args)
  invocation = "#{method_name}(#{args_statement})"
  method_name.include?("!") ? identity_test(returned, invocation, expectation, args) : equality_test(returned, invocation, expectation)
rescue Exception => e
  puts "failure: #{invocation} threw #{e}"
  puts e.backtrace.select {|t| !t.include?("method_missing") && !t.include?("print_test")}
  $failure_count += 1
end

fizzbuzzed = [1, 2, "fizz", 4, "buzz", "fizz", 7, 8, "fizz", "buzz", 11, "fizz",
              13, 14, "fizzbuzz", 16, 17, "fizz", 19, "buzz", "fizz", 22, 23, "fizz", "buzz",
              26, "fizz", 28, 29, "fizzbuzz"]

puts "
middle_substring:
" + "*" * 15 + "
"
test_middle_substring("middle", "dd")
test_middle_substring("mid", "i")

puts "
num_vowels:
" + "*" * 15 + "
"
test_num_vowels("Aruba", 3)
test_num_vowels("bcd", 0)
puts "
destructive_uppercase:
" + "*" * 15 + "
"
test_destructive_uppercase("doGgIE", "GIE")
test_destructive_uppercase("HI", "HI")
puts "
my_reverse:
" + "*" * 15 + "
"
test_my_reverse(["a", "b", "c"], ["c", "b", "a"])
test_my_reverse(["a"], ["a"])
puts "
my_join:
" + "*" * 15 + "
"
test_my_join(["k", "i", "t", "t", "y"], "", "kitty")
test_my_join(["dolla", "dolla"], "$", "dolla$dolla")
puts "
fizzbuzz:
" + "*" * 15 + "
"
test_fizzbuzz(fizzbuzzed)
puts "
"
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0
