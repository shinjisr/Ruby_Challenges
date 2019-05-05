# 6 kyu Tortoise racing
# https://www.codewars.com/kata/tortoise-racing/train/javascript

def race(v1, v2, g)
  time = g / (v2 - v1).to_f
  v2 > v1 ? [time.floor, (time * 60 % 60).floor, (time * 3600 % 60).floor] : nil
  [time.floor, (time * 60 % 60).floor, (time * 3600 % 60).floor] if v2 > v1
end

p race(720, 850, 70) #  [0, 32, 18] or "0 32 18"
p race(80, 91, 37)   #  [3, 21, 49] or "3 21 49"