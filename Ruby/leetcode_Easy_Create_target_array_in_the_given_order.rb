# Example 1:
# Input: nums = [0, 1, 2, 3, 4], index = [0, 1, 2, 2, 1]
# Output: [0, 4, 1, 3, 2]
#
# Input: nums = [1, 2, 3, 4, 0], index = [0, 1, 2, 3, 0]
# Output: [0, 1, 2, 3, 4]
#
#
def create_target_array(nums, index)
  res = []
  index.each_with_index { |ind, i| res.insert(ind, nums[i])} 
  res
end

nums = [0, 1, 2, 3, 4]
index = [0, 1, 2, 2, 1]

p create_target_array(nums, index)

