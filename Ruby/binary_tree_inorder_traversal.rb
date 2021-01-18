# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  ans = []
  return ans if root.nil?
  ans << inorder_traversal(root.left) if root.left
  ans << root.val
  ans << inorder_traversal(root.right) if root.right
  ans
end


# testcase
#
# []           # => []
# [1]          # => [1]
# [1,2]        # => [2, 1]
# [1,null,2]   # => [1, 2]
# [1,null,2,3] # => [1, 3, 2]
