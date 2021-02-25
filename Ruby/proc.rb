# `return` inside `proc` will end program
def proc_run
  proc = Proc.new { return }
  proc.call
  p "Run with Proc!"
end
proc_run # 跑不出來"Run with Proc"結果!

# `return` inside `lambda` will keep going
def lambda_run
  lam = -> { return }
  lam.call
  p "Run with lambda!"
end

lambda_run #=> "Run with lambda!"


# =============================
# Lambda checks arguments => ArgumentError
# Proc do not care



# =============================
def count_km(km)
  return Proc.new {|n| n*km}
end

full_marathon = count_km(42)
half_marathon = count_km(21) 

p full_marathon.call(3) # => 126
p half_marathon.call(2) # => 42
