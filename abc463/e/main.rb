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

N, M, Y = STDIN.gets.chomp.split.map(&:to_i)
UVTS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
XS = STDIN.gets.chomp.split.map(&:to_i)




def calc

  paths = {}
  N.times do |u|
    paths[u] ||= {}
    N.times do |v|
      paths[u][v] = XS[u] + XS[v] + Y unless u == v
    end
  end
  pp(paths:) if $debug

  UVTS.each do |u1, v1, t|
    u = u1 - 1
    v = v1 - 1
    if t < paths[u][v]
      paths[u][v] = t
      paths[v][u] = t
    end
  end
  pp(paths:) if $debug


  pq = AcLibraryRb::PriorityQueue.new { |(u1, t1), (u2, t2)| t1 < t2 }
  pq << [0, 0] #  都市1 = start, time = 0
  ts = Array.new(N)
  # ts[0] = 0 # 都市1 = start
  co = 0 # 計算済みの都市

  pp(pq:) if $debug

  while true
    u, t = pq.pop
    pp(u:, t:) if $debug
    next if ts[u] # 計算済み

    ts[u] = t # 訪問
    co += 1
    return ts if co == N

    paths[u].each do |v2, t2|
      next if ts[v2] # 訪問済み
      pq << [v2, t + t2]
    end
  end
  ts
end





ts = calc
pp(ts:) if $debug
puts ts[1...].join(' ')

