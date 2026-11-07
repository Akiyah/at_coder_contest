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
KS = STDIN.gets.chomp.split.map(&:to_i)

cs = (1..N).to_a


KS.each do |k|
  cs0 = cs[0...k]
  cs1 = cs[k..]

  cs0 = cs0.map { |c| -c }.reverse
  cs = cs0 + cs1
  pp(cs:) if $debug
end


cs.each do |c|
  puts c
end