# Definition for a binary tree node.

# =============================
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @return {Integer[]}

# =============================
# Recursive
# =============================
def inorder_traversal(root)
  ans = []
  return ans if root.nil?

  ans << inorder_traversal(root.left) if root.left
  ans << root.val
  ans << inorder_traversal(root.right) if root.right
  ans
end

# =============================
# Iterative
# =============================
def inorder_without_recursion(root)
  ans = []
  stack = []
  cur = root

  loop do
    if !cur.nil?
      stack << cur
      cur = cur.left
    elsif !stack.empty?
      cur = stack.pop
      ans << cur.val
      cur = cur.right
    else
      break
    end
  end

  ans
end

# =============================
# testcase
# =============================

# []                                 # => []
# [1]                                # => [1]
# [1,2]                              # => [2, 1]
# [1,null,2]                         # => [1, 2]
# [1,null,2,3]                       # => [1, 3, 2]
# [1,2,null,3,4]                     # => [3,2,4,1]
# [5,4,7,3,null,2,null,-1,null,9,10] # = > [3,2,4,1]
# [1, 2, 3, 4, 5, 6, 7]              # = > [4, 2, 5, 1, 6, 3, 7]

def make_node(arr)
  return nil if arr.empty?

  node = TreeNode.new(arr.shift)
end

def conv_arr_to_bt(arr)
  return nil if arr.nil?

  @cur ||= TreeNode.new(arr.shift)

  until @cur.nil?

    break if arr.empty?
    @cur.left = TreeNode.new(arr.shift)
    break if arr.empty?
    @cur.right = TreeNode.new(arr.shift)

    @cur = @cur.left
  end
end
