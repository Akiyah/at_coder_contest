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


N = STDIN.gets.chomp.to_i
AS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def merge(i, j)
  i, j = j, i if i < j
  AS[i - 1][j - 1]
end

a = 1
(1..N).each do |i|
  a = merge(a, i)
end

puts a

