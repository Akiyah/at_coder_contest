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
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

def calc_one(k, bs, ais6)
  pp(k:, bs:, ais6:) if $debug
  ais6.each do |a, i|
    return a unless bs.include?(i + 1)
  end

  ais6[k][0]
end



ais = AS.map.with_index { |a, i| [a, i] }.sort_by { |a, i| a }
ais6 = ais[0...6]

Q.times do
  k = STDIN.gets.chomp.to_i
  bs = STDIN.gets.chomp.split.map(&:to_i)
  puts calc_one(k, bs, ais6)
end

