#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

require "ac-library-rb/fenwick_tree"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
TABS = Q.times.map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp(AS:, TABS:) if $debug

def run
  fw = AcLibraryRb::FenwickTree.new([1,2,3])

  a_max_0 = AS.max
  a_max_1 = TABS.map do |t, a, b|
    t == 1 ? b : 0
  end.max

  a_max = [a_max_0, a_max_1].max

  fw = AcLibraryRb::FenwickTree.new(a_max + 1)
  fw1 = AcLibraryRb::FenwickTree.new(a_max + 1)
  AS.each do |a|
    fw.add(a, a)
    fw1.add(a, 1)
  end

  as = AS.dup

  if $debug
    fs = (0..a_max).map { |a| fw.sum(a, a + 1) }
    fs1 = (0..a_max).map { |a| fw1.sum(a, a + 1) }
    pp(as:, fs:, fs1:)
  end

  TABS.each do |t, a, b|
    pp(t:, a:, b:) if $debug
    if t == 1
      i, a2 = a, b
      fw.add(as[i - 1], -as[i - 1])
      fw.add(a2, a2)
      fw1.add(as[i - 1], -1)
      fw1.add(a2, 1)
      as[i - 1] = a2
    else
      l, r = a, b
      if r <= l
        x = N * l
      else
        x = 0
        x += fw1.sum(0, l) * l
        x += fw.sum(l, r)
        x += fw1.sum(r, a_max + 1) * r
      end
      puts x
    end
    if $debug
      fs = (0..a_max).map { |a| fw.sum(a, a + 1) }
      fs1 = (0..a_max).map { |a| fw1.sum(a, a + 1) }
      pp(as:, fs:, fs1:)
    end
  end
end

run
