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
    paths[u][v] = t
    paths[v] ||= {}
    paths[v][u] = t
  end
  pp(paths:) if $debug

  xus = XS.map.with_index { |x, u| [x, u] }.sort
  xj = 0
  min_x = XS[0]
  pp(xus:) if $debug

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
    u, t = pq.get
    while u && ts[u] # 計算済み
      pq.pop
      u, t = pq.get
    end
    pp(u:, t:) if $debug

    x, u2 = xus[xj]
    while ts[u2]
      xj += 1
      x, u2 = xus[xj]
    end
    pp(x:, u2:, xj:) if $debug

    if !u || min_x + Y + x < t
      xj += 1
      next_u = u2
      next_t = min_x + Y + x
    else
      pq.pop
      next_u = u
      next_t = t
    end
    pp(next_u:, next_t:) if $debug

    co += 1
    ts[next_u] = next_t

    if next_t + XS[next_u] < min_x
      min_x = next_t + XS[next_u]
    end

    return ts if co == N

    (paths[next_u] || []).each do |v2, t2|
      next if ts[v2] # 訪問済み
      pq << [v2, next_t + t2]
    end

    pp(ts:, co:, xj:, min_x:) if $debug
    # pp(pq:) if $debug
    pp('---') if $debug
  end
  ts
end





ts = calc
pp(ts:) if $debug
puts ts[1...].join(' ')

