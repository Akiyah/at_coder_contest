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
  M.times do |u|
    paths[u] ||= {}
    M.times do |v|
      paths[u][v] = XS[u] + XS[v] + Y
    end
  end

  UVTS.each do |u, v, t|
    if t < paths[u][v]
      paths[u][v] = t
      paths[v][u] = t
    end
  end


  pq = AcLibraryRb::PriorityQueue.new { |(u1, t1), (u2, t2)| t1 < t2 }
  pq << [0, 0] #  都市1 = start, time = 0
  ts = Array.new(N)
  ts[0] = 0 # 都市1 = start
  co = 1 # 計算済みの都市

  while true

    u, t = pq.pop

    paths_u = paths[u] || {}
    N.times do |v|
      next if v == u
      next if ts[v] # 訪問済み
      t2 = paths_u[v]
      t_new = if t2 && t2 < XS[u] + XS[v] + Y
                t + t2
              else
                t + XS[u] + XS[v] + Y
              end
      dp << [v, t_new]
      ts[v] = t_new
    end
  end
end





rs = calc
puts rs.join(' ')

