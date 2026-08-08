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


b = 0
as = Array.new(N, 0)
Q.times do |q|
  t, x = STDIN.gets.chomp.split.map(&:to_i)
  if t == 1
    a = as[x - 1]
    # b ^= a
    # b ^= (a + 1)
    as[x - 1] = a + 1
  else # t == 2
    N.times do |i|
      as[i] -= 1 if 0 < as[i]
    end
  end

  b = 0
  N.times do |i|
    b ^= as[i]
  end
  puts b
end
