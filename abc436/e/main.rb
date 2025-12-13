#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
PS = STDIN.gets.chomp.split.map(&:to_i)


dsu = AcLibraryRb::DSU.new(N)


PS.each.with_index do |a, i|
  dsu.merge(a - 1, i)
end


pp(dsu:) if $debug
pp(dsu.groups) if $debug

r = 0
dsu.groups.each do |group|
  n = group.size
  r += n * (n - 1) / 2
end

puts r
