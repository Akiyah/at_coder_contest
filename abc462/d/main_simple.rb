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

N, D = STDIN.gets.chomp.split.map(&:to_i)
STS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
pp(STS:) if $debug

r = 0
(0...N).to_a.combination(2).each do |a1, a2|
  pp(a1:, a2:) if $debug
  s1, t1 = STS[a1]
  s2, t2 = STS[a2]
  d = [t1, t2].min - [s1, s2].max
  pp(d:) if $debug

  if D <= d
    r += d - D + 1
  end
end

puts r

