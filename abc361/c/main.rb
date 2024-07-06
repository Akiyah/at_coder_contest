# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

as = AS.sort
pp as if $debug
a_min = as[0]
a_max = as[N - 1 - K]
a_diff_min = a_max - a_min

(0..K).each do |i|
  a_min = as[i]
  a_max = as[N - 1 - (K - i)]
  a_diff = a_max - a_min
  pp [a_min, a_max, a_diff] if $debug
  a_diff_min = a_diff if a_diff < a_diff_min
end

puts a_diff_min
