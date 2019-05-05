# 181223 - leetcode practice challenge
# Define a method that returns the sum of all the non-negative integers up to and including its argument.
# sum_to(3) => 6
def sum_to(int)
  i = 0
  sum = 0
  while i <= int
    sum = sum + i
  i += 1
  end
  sum
end

# Define a method, #e_words(str), that accepts a string as an argument. Your method return the number of words in the string that end with the letter "e".
# e_words("tree") => 1
# e_words("Let be be finale of seem.") => 3
# #### my way
# def e_words(str)
#   word = ""
#   count = 0
#   i = 0
#   while i < str.length
#     j = i + 1
#       if str[i].downcase == "e" && !(/\w/.match(str[j])) # /\w/ === str[j]
#           count = count + 1
#       end
#     i += 1
#   end
#   return count
# end
# ###

### answer:
def e_words(str)
  count = 0
  words = str.split
  i = 0
  while i < words.length
    word = words[i]
    if word[-1] == "e"
      count += 1
    end
    i += 1
  end
  count
end
###

# A magic number is a number whose digits, when added together, sum to 7, e.g., 34. Define a method that returns an array of the first n magic numbers. You may wish to write a helper method (magic_number?) that returns a boolean indicating whether a number is magic. This problem is harder than anything you'll receive on the coding assessment.
# magic_numbers(3) => [7, 16, 25]
# ### my way
# def magic_number?(n)
#   second_last_num = 0
#   if n < 10
#     last_num = n % 10
#   else
#     last_num = n % 10
#     second_last_num = (n % 100 - n % 10) / 10
#   end
#   last_num + second_last_num == 7 # 直接回傳 boolean value
# end

# def magic_numbers(n)
#   magic_arr = []
#   magic_arr_ans = []
#   numbers = (1..100).to_a
#   i = 0
#   while i < numbers.length
#     if magic_number?(numbers[i])
#       magic_arr << numbers[i]
#     end
#     i += 1
#   end
#   j = 0
#   while j < n
#     magic_arr_ans << magic_arr[j]
#     j += 1
#   end
#   magic_arr_ans
# end
# ###

### answer:
def magic_number?(n)
  sum = 0
  digits = n.to_s.split("")

  i = 0
  while i < digits.length
    digit = digits[i].to_i
    sum = sum + digit
    i += 1
  end

  sum == 7 # will either return true or false
end

def magic_numbers(n)
  magic_numbers_arr = []
  current_num = 1
  while magic_numbers_arr.length < n # to evaluate if array length meets the parameter "n", a clever move.
    if magic_number?(current_num)
      magic_numbers_arr << current_num
    end
    current_num += 1
  end

  magic_numbers_arr
end

###

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

puts "
sum_to:
" + "*" * 15 + "
"
test_sum_to(3, 6)
test_sum_to(0, 0)
puts "
e_words:
" + "*" * 15 + "
"
test_e_words("loom", 0)
test_e_words("To be or not to be", 2)
puts "
magic_numbers:
" + "*" * 15 + "
"
test_magic_numbers(3, [7, 16, 25])
test_magic_numbers(0, [])
puts
puts "TOTAL CORRECT: #{$success_count} / #{$success_count + $failure_count}"
puts "TOTAL FAILURES: #{$failure_count}"
$success_count = 0
$failure_count = 0