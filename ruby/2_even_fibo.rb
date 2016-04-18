require "benchmark"

even_fibo = Enumerator.new do |y|
  a = b = 1
  loop do 
    y << a if(a % 2 == 0)
    a, b = b, a + b
  end
end

result = 0
time = Benchmark.realtime do
  result = even_fibo.take_while { |i| i < 4_000_000 }.inject(:+)
end
puts "Code using enumerator"
puts "#{result} in #{time * 1e6} microseconds"

