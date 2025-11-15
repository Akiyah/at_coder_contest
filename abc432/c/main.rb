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

N, X, Y = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  d = Y - X
  a0 = AS[0]
  n0_min = X * a0
  n0_max = Y * a0

  AS.each do |a|
    n_min = X * a
    n_max = Y * a
    return -1 if (n_min - n0_min) % d != 0
    return -1 if n_max < n0_min
    return -1 if n0_max < n_min

    n0_min = n_min if n0_min < n_min
    n0_max = n_max if n_max < n0_max
  end

  pp(n0_min:, n0_max:) if $debug
  AS.map do |a|
    n_min = X * a
    (n0_max - n_min) / d
  end.sum
end



puts calc

