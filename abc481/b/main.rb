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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

r = 0
(N - 1).times do |i|
  a1 = AS[i]
  a2 = AS[i + 1]

  if (a1 <= K && K < a2) || (a2 < K && K <= a1)
    r += 1
  end
end

if AS[-1] == K
  r += 1
end

puts r

