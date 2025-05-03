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

N = STDIN.gets.chomp.to_i
SS = (1..N).map do
  STDIN.gets.chomp.split('')
end
TS = (1..N).map do
  STDIN.gets.chomp.split('')
end

pp SS if $debug
pp TS if $debug

def rotate(ss)
  (0...N).map do |i|
    (0...N).map do |j|
      ss[N - j - 1][i]
    end
  end
end

def count_diff(ss, ts)
  r = 0
  (0...N).each do |i|
    (0...N).each do |j|
      r += 1 if ss[i][j] != ts[i][j]
    end
  end
  r
end


ss0 = SS
ss1 = rotate(ss0)
ss2 = rotate(ss1)
ss3 = rotate(ss2)

pp ss0 if $debug
pp ss1 if $debug
pp ss2 if $debug
pp ss3 if $debug


c0 = count_diff(ss0, TS)
c1 = count_diff(ss1, TS) + 1
c2 = count_diff(ss2, TS) + 2
c3 = count_diff(ss3, TS) + 3


puts [c0, c1, c2, c3].min


