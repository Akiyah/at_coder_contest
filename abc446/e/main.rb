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

M, A, B = STDIN.gets.chomp.split.map(&:to_i)


zero_point_count = 0
zero_points = Array.new(M) { Array.new(M) }
paths = Array.new(M) { Array.new(M) { [] } }

dp = []
(1...M).map do |i|
  (1...M).map do |j|
    k = (A * j + B * i) % M
    paths[k][j] << [j, i]
    if k == 0
      zero_point_count += 1
      zero_points[j][i] = true
      dp << [j, i]
    end
  end
end

pp(zero_point_count:) if $debug
pp(zero_points:) if $debug
pp(dp:) if $debug
pp(paths:) if $debug

while 0 < dp.length
  k0, j0 = dp.shift
  pp(k0:, j0:, paths: paths[k0][j0]) if $debug
  paths[k0][j0].each do |j, i|
    unless zero_points[j][i]
      zero_point_count += 1
      zero_points[j][i] = true
      dp << [j, i]
    end    
  end
end

pp(zero_point_count:) if $debug
pp(zero_points:) if $debug
pp(dp:) if $debug
pp(paths:) if $debug

puts (M - 1) ** 2 - zero_point_count
