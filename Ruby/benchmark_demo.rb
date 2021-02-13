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

performance_test(:two_sum, :two_sum2)
