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
AS = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

as = {}
AS.each { |a| as[a] = true }
pp(as:) if $debug
XYS.each do |x, y|
  pp(x:, y:) if $debug
  as[x] = nil
  as[y] = true
  pp(as:) if $debug
end

rs = []
as.each do |a, b|
  rs << a if b
end


puts rs.sort.join(' ')




