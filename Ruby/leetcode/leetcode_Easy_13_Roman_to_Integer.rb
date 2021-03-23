require 'minitest/autorun'
require 'byebug'
=begin
Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
=end

class LeetCode
  class << self
    def rom_nums
      {
        'I' => 1,
        'V' => 5,
        'X' => 10,
        'L' => 50,
        'C' => 100,
        'D' => 500,
        'M' => 1000
      }
    end

    def roman_to_int2(s)
      res = 0
      tmp = 0

      s.chars.each_with_index do |el, i|
        if rom_nums[s[i + 1]] && rom_nums[el] < rom_nums[s[i + 1]]
          tmp = rom_nums[el]
        else
          res += (rom_nums[el] - tmp)
          tmp = 0
        end
      end
      res
    end

    def roman_to_int(s)
      res = 0
      last_char = ''
      arr = s.chars

      while arr.size > 0 do
        char = arr.shift
        num = rom_nums[char]
        las_num = rom_nums[last_char]

        case last_char
        when 'I'
          if ['V', 'X'].include?(char)
            res -= las_num
            num -= las_num
          end
        when 'X'
          if ['L', 'C'].include?(char)
            res -= las_num
            num -= las_num
          end
        when 'C'
          if ['D', 'M'].include?(char)
            res -= las_num
            num -= las_num
          end
        end

        res += num
        last_char = char
      end

      res
    end
  end
end

class Test < MiniTest::Test
  def setup
    @lc = LeetCode
  end

  def test_function1
    assert_equal(4, @lc.roman_to_int('IV'))
    assert_equal(3, @lc.roman_to_int('III'))
    assert_equal(9, @lc.roman_to_int('IX'))
    assert_equal(58, @lc.roman_to_int('LVIII'))
    assert_equal(1994, @lc.roman_to_int('MCMXCIV'))
  end

  def test_function2
    assert_equal(4, @lc.roman_to_int2('IV'))
    assert_equal(3, @lc.roman_to_int2('III'))
    assert_equal(9, @lc.roman_to_int2('IX'))
    assert_equal(58, @lc.roman_to_int2('LVIII'))
    assert_equal(1994, @lc.roman_to_int2('MCMXCIV'))
  end
end

