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

def calc
  i = 0
  i_max = i + AS[0] - 1
  pp(i:, a: AS[i], i_max:) if $debug
  while (i < i_max)
    i += 1
    i_max = [i + AS[i] - 1, i_max].max
    i_max = [N - 1, i_max].min
    pp(i:, a: AS[i], i_max:) if $debug
  end
  i_max + 1
end


puts calc

