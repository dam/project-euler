require 'benchmark'

class String
  def palindrome?
    self == self.reverse
  end
end

# NOTE: using complete resolution of arrays
class PalindromeProduct
  def self.for_digits(nb_digits)
    up = ('9' * nb_digits).to_i
    down = ('9' * (nb_digits - 1)).to_i + 1
    
    comb_products = up.downto(down).to_a.combination(2).map { |a,b| a * b }
    own_products = up.downto(down).map { |a| a * a }
    products = (comb_products + own_products).sort.reverse
    products.detect { |p| p.to_s.palindrome? }
  end
end

result = 0
time = Benchmark.realtime do
  result = PalindromeProduct.for_digits(3)
end
puts "Greatest palindrome product for 3 digits"
puts "#{result} in #{time * 1e6} microseconds"