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
AS = STDIN.gets.chomp.split.map(&:to_i)

rs = {}
d_min = -1
AS.each_with_index do |a, i|
  if rs[a]
    d = i - rs[a] + 1
    if d_min == -1 || d < d_min
      d_min = d
    end
  end
  rs[a] = i
end


puts d_min

