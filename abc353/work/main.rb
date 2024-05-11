# require "ac-library-rb/priority_queue"
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
KCAS = (1..M).map do
  k, c = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  [k, c, as]
end.sort_by { |k, c, as| c }

pp N, M if $debug
pp KCAS if $debug

dsu = AcLibraryRb::DSU.new(N)
# pq = AcLibraryRb::PriorityQueue.new {|x, y| x[1] < y[1] }

cost = 0
KCAS.each do |k, c, as|
  (0...k).each do |j|
    a0 = as[j] - 1
    a1 = as[(j + 1) % k] - 1
    a0, a1 = a1, a0 if a1 < a0

    if !dsu.same?(a0, a1)
      dsu.merge(a0, a1)
      cost += c
      if dsu.size(a0) == N
        puts cost
        exit
      end
    end
  end
end

puts -1
