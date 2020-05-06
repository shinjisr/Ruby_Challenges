// Given the array candies and the integer extraCandies, where candies[i] represents the number of candies that the ith kid has.

// For each kid check if there is a way to distribute extraCandies among the kids such that he or she can have the greatest number of candies among them. Notice that multiple kids can have the greatest number of candies.

// Input: candies = [2,3,5,1,3], extraCandies = 3
// Output: [true,true,true,false,true]
// Input: candies = [4,2,1,1,2], extraCandies = 1
// Output: [true,false,false,false,false]

var kidsWithCandies = function(candies, extraCandies) {
  const gt = Math.max(...candies);
  return candies.map((e) => e + extraCandies >= gt);
};

// Option 2:
var kidsWithCandies = function(candies, extraCandies) {
  const gt = Math.max.apply(null, candies);
  let res = [];

  for(let i = 0; i < candies.length; i++) {
    res.push(candies[i] + extraCandies >= gt);
  };

  return res;
};
