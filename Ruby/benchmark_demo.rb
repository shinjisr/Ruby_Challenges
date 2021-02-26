require 'benchmark'

def performance_test(*methods)
  n = 1_000_000
  test_case, target = [2,7,11,15], 9
  Benchmark.bm do |x|
    methods.each do |method|
      x.report(method) { n.times { send(method, test_case, target) } }
    end
  end
end

# performance_test(:foo_method, :foo_method2)

# =============================
# 使用 benchmark-ips 量測程式執行時間
# Benchmark-ips 會在 5 秒內盡可能執行程式，告訴你 5 秒內程式可以執行幾次（i/s，iteration per second）。
# 若要改為 10 秒：
# Benchmark.ips(10) do ... end
# gem install benchmark-ips
require 'benchmark/ips'

def noop(arg)
end

Benchmark.ips do |x|
  x.report("normal") { noop("foo") }
  x.report("frozen") { noop("foo".freeze)  }
end
# =============================
