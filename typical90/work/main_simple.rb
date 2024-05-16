# require "ac-library-rb/segtree"

$debug = !ARGV[0].nil?

N, B, K = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)

M = 10 ** 9 + 7

r = CS.repeated_permutation(N).count do |cs|
  cs.map.with_index { |c, i| c * (10 ** i) }.sum % B == 0
end

puts r % M
