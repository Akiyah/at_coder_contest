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

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
CDS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp({N:, M:, ABS:, Q:, CDS:}) if $debug


def calc
  CDS.map do |c, d|
    pp({c:, d:}) if $debug
    ABS.map do |a, b|
      r = ((a < c && c < b && b < d) || (c < a && a < d && d < b)) ? 1 : 0
      pp({a:, b:, r:}) if $debug
      r
    end.sum
  end
end


rs = calc
rs.each do |r|
  puts r
end

