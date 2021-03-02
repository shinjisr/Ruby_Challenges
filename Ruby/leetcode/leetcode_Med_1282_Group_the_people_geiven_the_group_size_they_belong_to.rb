# There are `n` people whose **IDs** go from `0` to `n - 1` and each person belongs **exactly** to one group. Given the array `groupSizes` of length `n` telling the group size each person belongs to, return the groups there are and the people's **IDs** each group includes.
# Input: group_sizes = [3, 3, 3, 3, 3, 1, 3]
# Output: [[5], [0, 1, 2], [3, 4, 6]]
# Input: groupSizes = [2,1,3,3,3,2]
# Output: [[1],[0,5],[2,3,4]]

# My soilution: 56 ms 75.61%, 9.6 Mb 100%
def group_the_people(group_sizes)
  n = group_sizes.length
  arr_map = {}
  group_sizes.uniq.each { |e| arr_map[e] = [] }
  group_sizes.each_with_index do |e, i|
    group = arr_map[e]
    arr_map[e] << i
  end
  res = []
  arr_map.each do |k, v|
    if v.size > k
     v.each_slice(k).to_a.each { |e| res << e}
    else
      res << v
    end
  end
  res
end

def group_the_people(group_sizes)
  group_sizes.each_with_index.group_by(&:first).flat_map { |s, e| e.map(&:last).each_slice(s).to_a }
end
