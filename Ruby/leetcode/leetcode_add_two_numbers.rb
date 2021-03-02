require 'byebug'
# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end

ln3 = ListNode.new(3, nil)
ln4 = ListNode.new(4, ln3)
ln4_2 = ListNode.new(4, nil)
ln6 = ListNode.new(6, ln4_2)
l1 = ListNode.new(2, ln4)
l2 = ListNode.new(5, ln6)
# Input: [2, 4, 3], [5, 6, 4]
# Output: [7, 0, 8]
#
# My solution: Runtime faster than 28.17%, Memory usage less than 85.71%
def add_two_numbers(l1, l2)
  tmp1 = [l1]
  tmp2 = [l2]
  
  while tmp1.last.next
   tmp1 << tmp1.last.next
  end

  while tmp2.last.next
   tmp2 << tmp2.last.next
  end

  i1 = tmp1.map(&:val).reverse.join.to_i
  i2 = tmp2.map(&:val).reverse.join.to_i
  i3 = i1 + i2
  a3 = i3.to_s.chars.each(&:to_i)

  res = ListNode.new(a3.shift)

  while a3.last
    res = ListNode.new(a3.shift, res)
  end
  res
end

# Other way, ref: https://leetcode.com/problems/add-two-numbers/discuss/244039/Elegant-Ruby-solution
# 12.48, 100%
def add_two_numbers(l1, l2)
  modulus, previous = 0, (dummy_head = ListNode.new nil)

  while l1 || l2 || modulus.nonzero?
    modulus, quotient = [l1&.val, l2&.val, modulus].compact.sum.divmod 10
    previous, l1, l2 = (previous.next = ListNode.new quotient), l1&.next, l2&.next
  end

  dummy_head.next
end

# Input: [2, 4, 3], [5, 6, 4]
# Output: [7, 0, 8]
p add_two_numbers(l1, l2)
