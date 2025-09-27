#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 

require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i


def calc
  n, k, x = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)

  pq = AcLibraryRb::PriorityQueue.new(as)

  k.times do
    a = pq.pop
    pq << a * 0.5
    pq << a * 0.5
  end

  a = nil
  x.times do
    a = pq.pop
  end
  a
end

T.times do
  r = calc
  puts sprintf('%.20f', r)
end

