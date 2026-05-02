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

  start_us = []
  oss.each.with_index do |os, u|
    start_us << u if os[0]
  end
  pp(start_us:) if $debug

  dp = start_us
  pp(dp:) if $debug

  (1..w).each do |j|
    dp2 = []
    dp.each do |u|
      dp2 += paths[u]
    end
    dp2.uniq!
    dp3 = []
    dp2.each do |u|
      # pp(u:) if $debug
      # pp(oss[u]) if $debug
      dp3 << u if oss[u][j % w]
    end
    dp = dp3
    pp(j:, dp:) if $debug
  end

  # start_us.intersect?(dp)
  0 < dp.length
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


