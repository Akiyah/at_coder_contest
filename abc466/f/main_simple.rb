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


def calc(n, x, as)
  r = 0
  (1..x).each do |y|
    as.each do |a|
      y %= a
    end
    r += 1 if y == 0
  end
  r
end

T.times do
  n, x = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, x, as)
end

