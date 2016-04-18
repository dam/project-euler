require 'prime'
require 'benchmark'

result = 0
time = Benchmark.realtime do
  result = Prime.prime_division(600_851_475_143).last.first
end
puts "Code with default Prime::Generator23"
puts "#{result} in #{time * 1e6} microseconds"

result = 0
time = Benchmark.realtime do
  result = Prime.prime_division(600_851_475_143, Prime::TrialDivisionGenerator.new).last.first
end
puts "Code with the Prime::TrialDivisionGenerator"
puts "#{result} in #{time * 1e6} microseconds"

result = 0
time = Benchmark.realtime do
  result = Prime.prime_division(600_851_475_143, Prime::EratosthenesGenerator.new).last.first
end
puts "Code with the Prime::EratosthenesGenerator"
puts "#{result} in #{time * 1e6} microseconds"
