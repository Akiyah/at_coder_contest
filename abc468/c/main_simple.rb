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
PS = STDIN.gets.chomp.split.map(&:to_i)
QS = STDIN.gets.chomp.split.map(&:to_i)


def lt(as, bs)
  N.times do |i|
    return true if as[i] < bs[i]
    return false if as[i] > bs[i]
  end

  false
end

r = 0
(1..N).to_a.permutation(N).each do |xs|
  if lt(PS, xs) && lt(xs, QS)
    r += 1 
  end
end

puts r
