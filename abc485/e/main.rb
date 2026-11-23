#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVCS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def next_step(paths, ls, u0, c0, d0, count0, v1, c1)
  l1 = ls[v1]
  if !l1 # まだ訪れたことがない
    ls[v1] = { c1: c1 }
    return [v1, c1, d0 + 1, 1]
  end

  # ２回目以降
  return nil if l1[:c2] # 3回目以降
  return nil if c1 == l1[:c1] # 1回目と同じ色

  l1[:c2] = c1
  return [v1, c1, d0 + 1, 2]
end

def calc
  paths = {}
  UVCS.each do |u, v, c|
    paths[u] ||= {}
    paths[u][v] ||= {}
    paths[u][v][c] = true
  end
  pp(paths:) if $debug

  ls = {}
  ls[1] = { c1: 0, c2: 0 }

  # pq = AcLibraryRb::PriorityQueue.new { |(u0, c0, d0, count0), (u1, c1, d1, count1)| d0 == d1 ? count0 < count1 : d0 < d1 }
  dp = []
  dp << [1, nil, 0, 1] # u, c, depth, count
  while !dp.empty?
    puts nil if $debug
    pp(dp:) if $debug
    pp(ls:) if $debug
    u0, c0, d0, count0 = dp.shift
    pp(u0:, c0:, d0:, count0:) if $debug
    l0 = ls[u0] # pqに入れるときに設定するので必ず存在する
    pp(l0:) if $debug

    if count0 == 1 # u0に1回目
      (paths[u0] || {}).each do |v1, c1s|
        c1s.each do |c1, b1|
          pp(v1:, c1:) if $debug
          next if c1 == c0
          return d0 + 1 if v1 == N # goal
          
          step = next_step(paths, ls, u0, c0, d0, count0, v1, c1)
          pp(step:) if $debug
          dp << step if step
        end
      end
    else # u0に2回目以降
      (paths[u0] || {}).each do |v1, c1s|
        c1s.each do |c1, b1|
          pp(v1:, c1:) if $debug
          next if c1 != l0[:c1]
          return d0 + 1 if v1 == N # goal
          
          step = next_step(paths, ls, u0, c0, d0, count0, v1, c1)
          pp(step:) if $debug
          dp << step if step
        end
      end
    end
  end

  -1
end




puts calc
