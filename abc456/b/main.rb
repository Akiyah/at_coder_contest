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

AS = (1..3).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def r(as, n)
  as.count(n).to_f / 6
end

ans = 0
ans += r(AS[0], 4) * r(AS[1], 5) * r(AS[2], 6)
ans += r(AS[0], 4) * r(AS[1], 6) * r(AS[2], 5)
ans += r(AS[0], 5) * r(AS[1], 4) * r(AS[2], 6)
ans += r(AS[0], 5) * r(AS[1], 6) * r(AS[2], 4)
ans += r(AS[0], 6) * r(AS[1], 4) * r(AS[2], 5)
ans += r(AS[0], 6) * r(AS[1], 5) * r(AS[2], 4)

puts ans