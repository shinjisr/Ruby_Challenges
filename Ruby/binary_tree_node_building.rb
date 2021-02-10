require 'byebug'
# WIP: Trying to build Binary tree from array
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

# =============================
# testcase
# =============================

# []
# [1]
# [1,2]
# [1,null,2]
# [1,null,2,3]
# [1,2,null,3,4]
# [5,4,7,3,null,2,null,-1,null,9,10]
# [1, 2, 3, 4, 5, 6, 7]

def mk_node(arr)
  node = TreeNode.new(arr.shift)
end

def mk_node(val)
  node = TreeNode.new(val)
end

# root = mk_node(arr)
# def conv_arr_to_bt(arr)
  # return if arr&.empty? || arr.nil? || !arr.is_a?(Array)
  # root = mk_node(arr)
  # cur = root
  # until arr.empty?
    # p cur.val
    # p '===='
    # cur.left = mk_node(arr)
    # # break if arr.empty?

    # cur.right = mk_node(arr)

    # cur = cur.left
  # end

  # root
# end


arr = [1, 2, 3, 4, 5, 6, 7]
res = []
cur_idx = 0
arr.each_with_index do |e, i|
# puts "ele: #{e}, i: #{i}"
  # first element
  if res.empty?
    cur_node = mk_node(e)
    res << cur_node
    cur_idx = i
  else
    cur_idx = next_idx if move_idx
    cur_node = res[cur_idx]
    if e
      if cur_node.left
        cur_node.right = mk_node(e)
        cur_idx = i
        move_idx = true
      else
        cur_node.left = mk_node(e)
        res << cur_node.left
        next_idx = i
        move_idx = false
      end
    end
  end
end

# puts res[0]

# p conv_arr_to_bt(arr)

# This method only push to node's right with bigger number
def pushNode(node, value)
  if (value > node.val)
    if node.right
      pushNode(node.right, value)
    else
      node.right = TreeNode.new(value)
    end
  else
    if node.left
      pushNode(node.left, value)
    else
      node.left = TreeNode.new(value)
    end
  end
end

# WIP: Try to refactor
def pushNode(node, value)
  return if value.nil?

  if node.left
    pushNode(node.left, value)
  elsif node.right
    pushNode(node.right, value)
  else
    return
  end
end

def create_nodes(arr)
  root = TreeNode.new(arr.shift)
  arr.each { |e| pushNode(root, e) }
  root
end
# byebug # comment

# puts create_nodes(arr)
