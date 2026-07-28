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


def next_ut(xus, pq_p, pq_x)
  u_p, v_p, t_p = pq_p.get
  pp(u_p:, v_p:, t_p:) if $debug
  u_x, v_x, t_x, j_x = pq_x.get
  pp(u_x:, v_x:, t_x:, j_x:) if $debug

  if t_x && t_x < t_p
    pq_x.pop

    # 今回のノードを1つずらす
    j3 = j_x + 1
    x3, u3 = xus[j3]
    if u3 == u_x
      j3 += 1
      x3, u3 = xus[j3] if j3 < N
    end
    pq_x << [u_x, u3, t_x + XS[u_x] + Y + XS[u3], j3] if j3 < N

    [v_x, t_x]
  else
    pq_p.pop
    [v_p, t_p]
  end
end

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
  pp(xus:) if $debug

  pq_p = AcLibraryRb::PriorityQueue.new { |(u1, v1, t1), (u2, v2, t2)| t1 < t2 }
  pq_p << [nil, 0, 0] # u(nil), v(都市1 = start), t = 0

  pq_x = AcLibraryRb::PriorityQueue.new { |(u1, v1, t1, j1), (u2, v2, t2, j2)| t1 < t2 }
  # pq_x << [0, 0] # u(都市1 = start), j = 0

  ts = Array.new(N)
  co = 0 # 計算済みの都市数

  while true
    u, t = next_ut(xus, pq_p, pq_x)
    pp(u:, t:) if $debug

    next if ts[u] # 計算済み

    ts[u] = t # 訪問
    co += 1
    pp(ts:, co:) if $debug
    return ts if co == N

    (paths[u] || []).each do |v2, t2|
      next if ts[v2] # 訪問済み
      pq_p << [u, v2, t + t2]
    end

    # 新しいノードをpq_xに追加
    j3 = 0
    x3, u3 = xus[j3]
    if u3 == u
      j3 += 1
      x3, u3 = xus[j3]
    end
    pq_x << [u, u3, t + XS[u] + Y + XS[u3], j3]
  end
  ts
end





ts = calc
pp(ts:) if $debug
puts ts[1...].join(' ')

