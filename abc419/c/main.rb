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
RCS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

r_max = RCS.map { |r, c| r }.max
r_min = RCS.map { |r, c| r }.min
c_max = RCS.map { |r, c| c }.max
c_min = RCS.map { |r, c| c }.min


dr = (r_max - r_min + 1) / 2
dc = (c_max - c_min + 1) / 2

puts [dr, dc].max

