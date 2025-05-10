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

H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.split('')
end

pp SS if $debug

es = []
as = Array.new(H) { Array.new(W) }
SS.each_with_index do |line, i|
  line.each_with_index do |s, j|
    if s == 'E'
      es << [i, j]
    end
    if s != '.'
      as[i][j] = s
    end
  end
end

pp es if $debug
pp as if $debug


dp = es.dup

while 0 < dp.length
  pp dp if $debug
  dp_new = []
  dp.each do |i, j|
    if i + 1 < H && as[i + 1][j] == nil
      as[i + 1][j] = '^'
      dp_new << [i + 1, j]
    end
    if 0 <= i - 1 && as[i - 1][j] == nil
      as[i - 1][j] = 'v'
      dp_new << [i - 1, j]
    end
    if j + 1 < W && as[i][j + 1] == nil
      as[i][j + 1] = '<'
      dp_new << [i, j + 1]
    end
    if 0 <= j - 1 && as[i][j - 1] == nil
      as[i][j - 1] = '>'
      dp_new << [i, j - 1]
    end
  end
  pp as if $debug
  dp = dp_new
end

pp as if $debug

as.each do |line|
  puts line.join('')
end
