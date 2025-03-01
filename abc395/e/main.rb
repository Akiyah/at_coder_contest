#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M, X = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


ps = {}
ps[true] = {}
ps[false] = {}
UVS.each do |u, v|
  ps[true][u] ||= []
  ps[true][u] << v
  ps[false][v] ||= []
  ps[false][v] << u
end


def calc(ps)
  pq = AcLibraryRb::PriorityQueue.new {|x, y| x[2] < y[2] }
  pq.push([1, true, 0])
  
  xs = {}
  xs[true] = {}
  xs[false] = {}

  while true
    u, face, value = pq.pop

    next if xs[face][u]

    xs[face][u] = true

    return value if u == N

    (ps[face][u] || []).each do |v|
      pq.push([v, face, value + 1]) unless xs[face][v]
    end
    # さらに反転させる
    (ps[!face][u] || []).each do |v|
      pq.push([v, !face, value + X + 1]) unless xs[!face][v]
    end
  end
end



puts calc(ps)
