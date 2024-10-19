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

T = STDIN.gets.chomp.to_i

NKABS = (1..T).map do
  n, k = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  bs = STDIN.gets.chomp.split.map(&:to_i)
  [n, k, as, bs]
end


NKABS.each do |n, k, as, bs|
  r = (1..n).to_a.combination(k).map do |ss|
    x = ss.map { |s| as[s - 1] }.max
    y = ss.map { |s| bs[s - 1] }.sum
    x * y
  end.min
  puts r
end
