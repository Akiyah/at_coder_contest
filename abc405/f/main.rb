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


def calc(c, d, abs)
  ic = abs.bsearch_index { |a, b| c < a }
  id = abs.bsearch_index { |a, b| d < a } # ac == nil => ad == nil

  if a != nil
    abs0 = abs[...a]
    abs1 = abs[a..]
  else
    abs0 = abs[..a]
    abs1 = abs[a..]
  end


  abs.map do |a, b|
    r = ((a < c && c < b && b < d) || (c < a && a < d && d < b)) ? 1 : 0
    pp({a:, b:, r:}) if $debug
    r
  end.sum
end

abs = ABS.sort_by { |a, b| a }
pp abs if $debug

CDS.map do |c, d|
  puts calc(c, d, abs)
end
