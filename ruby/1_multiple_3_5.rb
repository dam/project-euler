require 'benchmark'

LIMIT = 1000
result = nil

def original(limit)
  (1...limit).inject(0) { |sum, i| sum + (i % 3 == 0 || i % 5 == 0 ? i : 0) }  
end

def clearer(limit)
  (1...limit).select { |x| (x % 3 == 0) || (x % 5 == 0) }.inject(:+) 
end

# Ruby 2.x
def lazy(limit)
  (1..Float::INFINITY).lazy.select { |x| (x % 3 == 0) || (x % 5 == 0) }.take_while { |x| x < limit }.inject(:+)
end

Benchmark.bm(7) do |b|
  b.report('original') { result = original(LIMIT) }
  b.report('clearer')  { clearer(LIMIT) }
  b.report('lazy')     { lazy(LIMIT) }
end
puts "\nResult: #{result}"
