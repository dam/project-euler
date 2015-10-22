original = fn limit ->
  multiple? = fn n -> rem(n, 3) == 0 or rem(n, 5) == 0 end
  l = for n <- 0..(limit - 1), multiple?.(n), do: n
  Enum.reduce(l, &+/2)	
end

{time, result} = :timer.tc(fn -> original.(1000) end)
IO.puts "Result: #{result} in #{time} microseconds"