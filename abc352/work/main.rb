require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, M = STDIN.gets.chomp.split.map(&:to_i)
KCS = []
AS = []
(1..M).each do
  KCS << STDIN.gets.chomp.split.map(&:to_i)
  AS << STDIN.gets.chomp.split.map(&:to_i)
end

pp N, M if $debug
pp KCS if $debug
pp AS if $debug


dsu0 = AcLibraryRb::DSU.new(N)
pq = AcLibraryRb::PriorityQueue.new {|x, y| x[1] < y[1] }

(0...M).each do |i|
  k, c = KCS[i]
  as = AS[i]
  (0...k).each do |j|
    a0 = as[j] - 1
    a1 = as[(j + 1) % k] - 1
    a0, a1 = a1, a0 if a1 < a0

    dsu0.merge(a0, a1)

    pq.push([[a0, a1], c])
  end
end

pp dsu0.groups if $debug

unless dsu0.groups.size == 1
  puts '-1'
  exit
end

pp pq if $debug

dsu = AcLibraryRb::DSU.new(N)

cost = 0
while !pq.empty?
  a01, c = pq.pop
  a0, a1 = a01

  if !dsu.same?(a0, a1)
    dsu.merge(a0, a1)
    cost += c
    if dsu.size(a0) == N
      puts cost
      exit
    end
  end
end


