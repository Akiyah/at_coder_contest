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
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end



def calc(n, s)
  i = s.index('1')
  j = s.rindex('1')

  return 0 if i == nil # すべて0

  s2 = s[i..j]
  r0 = s2.count('0')
  ls = s2.split('0').map do |as|
    as.length
  end

  r1 = ls.sum - ls.max

  [r0, r1].min
end




T.times do
  n = STDIN.gets.chomp.to_i
  s = STDIN.gets.chomp

  puts calc(n, s)
end

