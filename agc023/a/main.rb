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



s = 0
bs = [0] + AS.map { |a| s += a }

cs = Hash.new(0)
bs.each do |b|
  cs[b] += 1
end

pp(AS:, bs:, cs:) if $debug

r = 0
cs.each do |c, v|
  r += v * (v - 1) / 2
end

puts r
