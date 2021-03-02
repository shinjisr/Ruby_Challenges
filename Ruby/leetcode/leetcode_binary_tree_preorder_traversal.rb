# Definition for a binary tree node.
def preorder_traversal(root)
  ans = []
  ans << root.val << preorder_traversal(root.left) << preorder_traversal(root.right)
  ans
end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end
@param {TreeNode} root
@return {Integer[]}
