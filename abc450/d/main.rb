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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  as = AS.map { |a| a % K }.sort

  m0 = as[-1] - as[0]

  ms = (0...(N - 1)).map do |i|
    (as[i] + K) - as[i + 1]
  end

  ([m0] + ms).min
end

puts calc


