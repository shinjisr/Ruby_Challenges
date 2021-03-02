
# 2021-03-02 13:36:00 +0100
# My first attempt
def running_sum(nums)
  res = []
  las_dig = 0
  nums.each do |e|
    res << e + las_dig
    las_dig = res.last
  end
  
  res
end

def running_sum(nums)
  total = 0
  nums.map { |num| total += num }
end


test_case = [1,2,3,4]    # => [1,3,6,10]
test_case2 = [1,1,1,1,1]  # => [1,2,3,4,5]
test_case3 = [3,1,2,10,1] # => [3,4,6,16,17]
p running_sum(test_case)
p running_sum(test_case2)
p running_sum(test_case3)
