#  7 kyu Mumbling
#  https://www.codewars.com/kata/5667e8f4e3f572a8f2000039/solutions/javascript

#  The best practice:
#  The most clever solution:

def accum(s)
  # s.split('').map.with_index{|x, i| (x * (i + 1)).capitalize}.join('-')
  s.chars.map.with_index{|x, i| (x * (i + 1)).capitalize}.join('-')
end

p accum("ZpglnRxqenU");
p accum("NyffsGeyylB");