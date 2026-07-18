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
BS = STDIN.gets.chomp.split.map(&:to_i)

pp(AS:) if $debug
pp(BS:) if $debug

as = []
f = true
(0...(N-1)).map do |i|
  if f
    as[i] = AS[i]
  else
    as[i] = 1 - AS[i]
  end
  if BS[i] == 1
    f = !f
  end
end

if f
  as[N - 1] = AS[N - 1]
else
  as[N - 1] = 1 - AS[N - 1]
end

pp(as:) if $debug

r = as.sum
# N.times do |i|
#   r += 1 if AS[i] != as[i]
# end


puts [r, N - r].min

