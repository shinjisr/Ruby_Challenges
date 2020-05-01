=begin
Given an array of integers `arr`, replace each element with its rank.

The rank represents how large the element is. The rank has the following result:
- Rank is an integer starting from 1.
- The larger the element, the larger the rank. If two elements are equal, their rank must be the same.
Rank should be as small as possible.

Example 1:
Input: arr = [40, 10, 20, 30]
Output: [4, 1, 2, 3]

Example 2:
Input: arr = [100, 100, 100]
Output: [1, 1, 1]
=end


# @param {Integer[]} arr
# @return {Integer[]}
def array_rank_transform(arr)
  # res = {}
  i = 0
  # arr.sort.each { |e| res[e] = i += 1 unless res[e] }
  # arr.collect { |e| res[e] }
  # res = arr.sort.reduce({}) { |acc, e| acc[e] = i += 1 unless acc[e] }
  # WIP
  res = arr.sort.reduce({}) { |acc, e| p acc[e] = i += 1, e }
  arr.collect { |e| res[e] }
end

def array_rank_transform(arr)
  res = {}
  i = 0
  arr.sort.each { |e| res[e] = i += 1 unless res[e] }
  arr.collect { |e| res[e] }
end

