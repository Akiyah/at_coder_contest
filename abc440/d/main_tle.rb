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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(x, y, as)
  pp(x:, y:, as:) if $debug
  r = (x..(x + N + y)).bsearch do |r|
    co = as.select { |a| x <= a && a <= r}.size
    y <= r - x + 1 - co
  end
  pp(r:) if $debug
  r
end

as = AS.sort
XYS.each do |x, y|
  puts calc(x, y, as)
end


