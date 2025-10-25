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

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
S = STDIN.gets.chomp

def calc
  paths = {}
  UVS.each do |u, v|
    paths[u - 1] ||= []
    paths[u - 1] << v - 1
    paths[v - 1] ||= []
    paths[v - 1] << u - 1
  end


  ss = S.chars.map { |c| c == 'S' }

  pp(paths:, ss:) if $debug

  ls = N.times.map { |i| [] }

  dp = []
  ss.each.with_index do |s, i|
    if s
      dp << [i, 0]
      ls[i] << { l: 0, from: i }
    end
  end

  pp(ls:) if $debug
  while 0 < dp.length
    u, x = dp.shift
    paths[u].each do |v|
      next if ls[v][0] && ls[v][1] # v が計算済み

      y0 = ls[v][0]
      y1 = ls[v][0]
      if ls[u][0]
        x = ls[u][0]
        if !(y0 && x[:from] == y0[:from]) && !(y1 && x[:from] == y1[:from])
          ls[v] << { l: x[:l] + 1, from: x[:from] }
        end
      end
      if ls[u][1]
        x = ls[u][1]
        if !(y0 && x[:from] == y0[:from]) && !(y1 && x[:from] == y1[:from])
          ls[v] << { l: x[:l] + 1, from: x[:from] }
        end
      end
      ls[v] = ls[v].sort_by { |x| x[:l] }[0...2]
      dp << v
    end
    pp(ls:) if $debug
  end

  rs = []
  ss.each.with_index do |s, u|
    rs << ls[u][0][:l] + ls[u][1][:l] unless s
  end

  rs
end


rs = calc
pp(rs:) if $debug
rs.each do |r|
  puts r
end
