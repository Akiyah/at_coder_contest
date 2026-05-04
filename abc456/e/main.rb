#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i



def calc(n, m, uvs, w, ss)
  pp(n:, m:, uvs:, w:, ss:) if $debug

  paths = Hash.new { |hash, key| hash[key] = [] }
  uvs.each do |u, v|
    paths[u - 1] << v - 1
    paths[v - 1] << u - 1
  end
  n.times do |u|
    paths[u] << u
  end

  oss = ss.map { |s| s.chars.map { |c| c == 'o' } }
  pp(paths:, oss:) if $debug

  dp = []
  useds = Array.new(n) { [] }

  dp << []
  oss.each.with_index do |os, u|
    dp[0] << u if os[0]
  end

  d = 0
  route_data = Array.new(n) { [] }
  route = []
  while true

    if dp[d].length == 0 # 一つ上の次に戻る
      return false if d == 0 # 全部探索した
      u = route.pop
      route_data[u][(d - 1) % w] = false
      d -= 1
      next
    end

    u = dp[d].pop
    route << u

    return true if route_data[u][d % w] # 同じところを通ったことがある
    route_data[u][d % w] = true

    next if useds[u][d % w] # すでに確認済みの場合
    useds[u][d % w] = true

    vs = paths[u].filter { |v| oss[v][(d + 1) % w] }
    dp[d + 1] = vs
    d += 1
  end

  false
end


T.times do
  n, m = STDIN.gets.chomp.split.map(&:to_i)
  uvs = (1..m).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end
  w = STDIN.gets.chomp.to_i
  ss = (1..n).map do
    STDIN.gets.chomp
  end

  r = calc(n, m, uvs, w, ss)
  puts r ? 'Yes' : 'No'
end


