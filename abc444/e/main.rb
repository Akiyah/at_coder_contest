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

    j0 = bs.bsearch_index { |b| a - D < b[0] }
    if !j0
      bs = bs + [[a, i]]
      next
    end

    j1 = bs.bsearch_index { |b| a + D <= b[0] }

    
    j = if j1
      bs[j0...j1].map { |b| b[1] }.max
    else
      bs[j0...].map { |b| b[1] }.max
    end
    r = j + 1

    bs0 = 0 < j0 ? bs[0..(j0 - 1)] : []
    bs1 = j1 ? bs[j1..] : []
    bs = bs0 + [[a, i]] + bs1


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

