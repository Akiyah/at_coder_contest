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
  UVTS.each do |u1, v1, t|
    u = u1 - 1
    v = v1 - 1

    paths[u] ||= {}
    if !paths[u][v] || t < paths[u][v] 
      paths[u][v] = t
    end
    paths[v] ||= {}
    paths[v][u] = t
    if !paths[v][u] || t < paths[v][u] 
      paths[v][u] = t
    end
  end
  pp(paths:) if $debug

  # u1: N
  # u2: N + 1
  u_1 = N
  u_2 = N + 1
  paths[u_1] = {}
  paths[u_1][u_2] = Y
  XS.each.with_index do |x, u|
    paths[u] ||= {}
    paths[u][u_1] = x
    paths[u_2] ||= {}
    paths[u_2][u] = x
  end
  pp(paths:) if $debug

  pq = AcLibraryRb::PriorityQueue.new { |(u1, t1), (u2, t2)| t1 < t2 }
  # pq << [0, 0] # u(都市1 = start), t = 0

  ts = Array.new(N)
  ts[0] = 0
  co = 1 # 計算済みの都市数

  (paths[0] || []).each do |v2, t2|
    next if ts[v2] # 訪問済み
    pq << [v2, 0 + t2]
  end

  while true
    u, t = pq.pop
    pp(u:, t:) if $debug
    next if ts[u] # 計算済み

    co += 1
    ts[u] = t

    return ts if co == N + 2

    (paths[u] || []).each do |v2, t2|
      next if ts[v2] # 訪問済み
      pq << [v2, t + t2]
    end

    pp(ts:, co:) if $debug
    # pp(pq:) if $debug
    pp('---') if $debug
  end
  ts
end


ts = calc
pp(ts:) if $debug
puts ts[1...N].join(' ')

