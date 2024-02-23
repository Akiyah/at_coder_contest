N, K, L = gets.chomp.split.map(&:to_i)

def check(x)
  y = x.combination(K).to_a
  y.length == y.uniq.length
end

c = 0
(0 ... (L ** N)).each do |i|
  x = (0...N).map do |j|
    i / (L ** (N - j - 1)) % L
  end

  r = check(x)
  pp x if r

  # r ? 1 : 0
  c += 1 if r
end

puts c

