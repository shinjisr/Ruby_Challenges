# frozen_string_literal: true

require 'byebug'
require 'benchmark'
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def attrs
    instance_variables.map { |ivar| instance_variable_get ivar }
  end
end
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

# Testcase
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
test_nod = nil

def make_node(count)
  return if count < 0

  idx = count
  node = TreeNode.new(val: idx)
  while idx >= 0
    p "index: #{idx}"
    idx -= 1
    left_node = make_node(idx)
    p "left_node: #{left_node}"
    node.left = left_node
    p "in while loop node: #{node.attrs}."
  end
  p '=' * 25
  p "outside the while loop, node: #{node.attrs}."
  p '=' * 25
  node
end

node = make_node(3)
byebug # node

Benchmark.bm do |x|
  x.report { preorder_traversal }
end
