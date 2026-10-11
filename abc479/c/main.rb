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

N, W = STDIN.gets.chomp.split.map(&:to_i)
AS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc(n, w, sum_a)
  pp(n:, w:, sum_a:) if $debug
  return sum_a if n <= 0

  a, b = AS[n - 1]

  r1 = 0
  r1 = calc(n - 1, w - b, sum_a + a) if 0 <= w - b

  r2 = calc(n - 1, w, sum_a)

  puts (' ' * n) + "n:#{n}, w:#{w}, r1:#{r1}, r2:#{r2}" if $debug

  [r1, r2].max
end



r = calc(N, W, 0)

puts r
