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

a, b, c, d, e, f = STDIN.gets.chomp.split.map(&:to_i)
g, h, i, j, k, l = STDIN.gets.chomp.split.map(&:to_i)



(j <= a || d <= g) || (k <= b || e <= h) || (l <= c || f <= i) ? puts("No") : puts("Yes")

