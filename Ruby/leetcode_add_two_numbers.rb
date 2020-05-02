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

p add_two_numbers(l1, l2)
