# Squares of a Sorted Array
# https://leetcode.com/submissions/detail/226874507/

arr = [-4, -1, 0, 3, 10] # [0, 1, 9, 16, 100]

def sorted_squares(a)
  a.map{|e| e * e}.sort
end

# refactored
def sorted_squares(a)
  a.map(&:abs2).sort
end


p sorted_squares(arr)