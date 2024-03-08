# require "ac-library-rb/segtree"

N, L = gets.chomp.split.map(&:to_i)
K = gets.chomp.to_i
AS = gets.chomp.split.map(&:to_i)

# pp AS.combination(K).to_a

result = AS.combination(K).map do |as|
  # pp as
  as = ([0] + as + [L])
  # pp "as"
  # pp as
  # pp "(0...K).map { |i| as[i + 1] - as[i] }"
  # pp (0..K).map { |i| as[i + 1] - as[i] }
  (0..K).map { |i| as[i + 1] - as[i] }.min
end.max

# pp result
puts result
