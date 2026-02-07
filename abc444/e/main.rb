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
  ais = AS.map.with_index { |a, i| [a, i]}

  bs = []
  l = 0
  r = 0
  ais.each do |a, i|

    j0 = bs.bsearch_index { |b| b[0] <= a - D }
    j1 = bs.bsearch_index { |b| b[0] < a + D }

    if !j0 || !j1

    else
    bs0 = bs[0..(j0 - 1)]
    bs1 = bs[j1..]
    bs = bs0 + 

    bs << ais[]


    while true

    bs


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

