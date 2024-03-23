# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

k_sum = K * (K + 1) / 2

r = k_sum - AS.select { |a| a <= K }.uniq.sum

puts r
