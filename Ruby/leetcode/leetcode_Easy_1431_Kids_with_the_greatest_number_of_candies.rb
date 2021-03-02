Given the array candies and the integer extraCandies, where candies[i] represents the number of candies that the ith kid has.

For each kid check if there is a way to distribute extraCandies among the kids such that he or she can have the greatest number of candies among them. Notice that multiple kids can have the greatest number of candies.

# My submission: 100%, 100%: 28 ms 9.6 MB
def kids_with_candies(candies, extra_candies)
  gt = candies.max
  candies.reduce([]) { |res, e| res.push(e + extra_candies >= gt) }
end

# Better solution: 28, 9.5
def kids_with_candies(candies, extra_candies)
  gt = candies.sort[-1]
  candies.map { |e| e + extra_candies >= gt }
end

# Input: candies = [2,3,5,1,3], extraCandies = 3
# Output: [true,true,true,false,true]
# Input: candies = [4,2,1,1,2], extraCandies = 1
# Output: [true,false,false,false,false]
