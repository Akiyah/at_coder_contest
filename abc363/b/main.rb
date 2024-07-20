require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, T, P = STDIN.gets.chomp.split.map(&:to_i)
LS = STDIN.gets.chomp.split.map(&:to_i)

ls = LS.sort.reverse
pp ls if $debug

t = T - ls[P - 1]

pp [t, T, P - 1, ls[P - 1]] if $debug

puts (0 <= t) ? t : 0
