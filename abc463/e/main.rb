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
  js = Array.new(N, 0)
  pp(xus:) if $debug

  pq = AcLibraryRb::PriorityQueue.new { |(u1, t_u1, v1, t_v1), (u2, t_u2, v2, t_v2)| t_v1 < t_v2 }
  pq << [nil, nil, 0, 0] # u, t_u, v(都市1 = start), t_v = 0

  ts = Array.new(N)
  co = 0 # 計算済みの都市数

  # u = 0
  j = js[0] # 0
  x1, u1 = xus[j]
  pq << [0, 0, u1, 0 + XS[0] + XS[u1] + Y]
  js[0] += 1

  while true
    pp(pq:) if $debug
    pp(ts:, co:) if $debug
    u, t_u, v, t_v = pq.pop
    pp(u:, t_u:, v:, t_v:) if $debug

    if u
      j = js[u]
      if j < N
        x1, u1 = xus[j]
        pp(j:, x1:, u1:) if $debug
        pq << [u, t_u, u1, t_u + XS[u] + XS[u1] + Y]
        js[u] += 1
      end
    end

    next if ts[v] # 計算済み

    ts[v] = t_v # 訪問
    co += 1
    return ts if co == N

    (paths[v] || []).each do |v2, t2|
      next if ts[v2] # 訪問済み

      pq << [v, t_v, v2, t_v + t2]
    end
  end
  ts
end





ts = calc
pp(ts:) if $debug
puts ts[1...].join(' ')

