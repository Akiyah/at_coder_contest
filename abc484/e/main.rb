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

N, L, R = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
pp(N:, L:, R:) if $debug
pp(AS:) if $debug




def calc(ss, v) # vより小さくなる数
  r = 0
  N.times do |i|
    (i...N).each do |j|
      s = ss[j + 1] - ss[i]
      pp(i:, j:, s:) if $debug
      r += 1 if s <= v
    end
  end
  r
end


s = 0
ss = []
ss << s
AS.each do |a|
  s += a
  ss << s
end
pp(ss:) if $debug

puts calc(ss, R) - calc(ss, L - 1)

