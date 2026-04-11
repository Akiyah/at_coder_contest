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

T, X = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

rs = []
(0..T).each do |t|
  if t == 0
    rs << [0, AS[0]]
  else
    if X <= (rs[-1][1] - AS[t]).abs
      rs << [t, AS[t]]
    end
  end
end

rs.each do |t, a|
  puts [t, a].join(' ')
end
