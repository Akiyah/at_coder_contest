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

N, K, X = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)




def calc
  as = AS.sort
  pp(as:) if $debug
  pp(as[...K]) if $debug

  if as[...K].sum < X
    return -1
  end

  a_sum = 0
  as[...K].reverse.each.with_index do |a, i|
    pp(a:, i:) if $debug
    a_sum += a
    if X <= a_sum
      return (N - K) + i + 1
    end
  end

end

puts calc

