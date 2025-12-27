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
BS = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  (0...(N - 2)).map do |x|
    ((x + 1)...(N - 1)).map do |y|
      r = AS[0..x].sum + BS[(x + 1)..y].sum + CS[(y + 1)..].sum
      if r == 52
        pp(AS[0..x])
        pp(BS[(x + 1)..y])
        pp(CS[(y + 1)..])
        pp(x:, y:, r:) if $debug
      end
      r
    end.max
  end.max
end


puts calc

