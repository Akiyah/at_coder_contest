N, K, L = gets.chomp.split.map(&:to_i)

m = N - K
r = 1
(0...N).each do |i|
  r *= [L - i, L - m].max
  r %= 998244353
end

puts r

