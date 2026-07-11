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
CSS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


data = {}
CSS.each do |c, s|
  if !data[c] || data[c] < s
    data[c] = s
  end
end

rs = M.times.map do |c|
  data[c + 1] || -1
end
puts rs.join(' ')

