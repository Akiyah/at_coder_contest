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
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
ABS.each do |a, b|
  paths[a] ||= []
  paths[a] << b
end

items = {}
items[1] = true
dp = [1]

pp(dp:) if $debug
while 0 < dp.length
  a = dp.shift
  bs = paths[a]
  if bs
    bs.each do |b|
      if !items[b]
        dp << b
        items[b] = true
      end
    end
    pp(dp:) if $debug
  end
end

puts items.length






