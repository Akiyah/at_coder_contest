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
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc

  ans = 0
  (0...N).each do |l|
    (l...N).each do |r|
      b = AS[l..r].combination(2).all? do |a1, a2|
        pp(a1:, a2:, b: D <= (a1 - a2).abs) if $debug
        D <= (a1 - a2).abs
      end
      pp(l:, r:, b:) if $debug
      ans += 1 if b
    end
  end
  ans
end



puts calc

