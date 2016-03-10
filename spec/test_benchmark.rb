require_relative 'spec_helper.rb'

describe "my example Benchmark" do
  bench_range { bench_exp 1, 10_000 }
  bench_performance_linear "welcome benchmark test", 0.9999 do |n|
    n.times do
      get '/'
      last_response.body.must_include 'Hello, World!'
    end
  end
end
