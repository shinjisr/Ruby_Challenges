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
def preorder_traversal(root)
  ans = [] 
  return ans if root.nil?
  ans << root.val
  ans << preorder_traversal(root.left) if root.left
  ans << preorder_traversal(root.right) if root.right
  ans.flatten
end


# Input

# []
# [3,1,2]
# [3,1,null,4]
# [1,null,2,3]

# Expected answer

# []
# [3,1,2]
# [3,1,4]
# [1,2,3]
