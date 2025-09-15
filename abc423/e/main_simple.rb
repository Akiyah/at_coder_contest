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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(li, ri)
  (li..ri).map do |l|
    (l..ri).map do |r|
      (l..r).map do |j|
        AS[j - 1]
      end.sum
    end.sum
  end.sum
end

LRS.each do |li, ri|
  puts calc(li, ri)
end
