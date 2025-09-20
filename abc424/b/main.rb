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

N, M, K = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..K).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  test = {}
  results = []
  ABS.each do |a, b|
    test[a] ||= []
    test[a] << b
    if test[a].length == M
      results << a
    end
  end
  results
end


results = calc
puts results.join(' ')

