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
    pp(dp:, d:, route:) if $debug
    pp(route_data:) if $debug
    if $debug
      x = route_data.map.with_index do |line, u|
        w.times.map do |d|
          if line[d]
            '*'
          else
            oss[u][d] ? 'o' : 'x'
          end
        end.join('')
      end
      puts x
      puts
    end

    if $debug
      x = useds.map.with_index do |line, u|
        w.times.map do |d|
          line[d] ? '*' : '.'
        end.join('')
      end
      puts x
      puts
    end

    if dp[d].length == 0 # 一つ上の次に戻る
      return false if d == 0 # 全部探索した
      u = route.pop
      pp(u:, d:, w:) if $debug
      pp('route_data[u]' =>  route_data[u]) if $debug
      route_data[u][(d - 1) % w] = false
      pp('route_data[u]' =>  route_data[u]) if $debug
      d -= 1
      next
    end

    u = dp[d].pop

    pp(route:) if $debug
    return true if route_data[u][d % w] # 同じところを通ったことがある

    pp('useds[u][d % w]' => useds[u][d % w]) if $debug
    if useds[u][d % w] # すでに確認済みの場合
      next
    else
      route << u
      useds[u][d % w] = true
      route_data[u][d % w] = true
      pp(route_data:) if $debug

      vs = paths[u].filter { |v| oss[v][(d + 1) % w] }
      dp[d + 1] = vs
      d += 1
    end
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


