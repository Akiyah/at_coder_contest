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

N = STDIN.gets.chomp.to_i
DS = STDIN.gets.chomp.split.map(&:to_i)


(0...(N - 1)).each do |i|
  rs = []
  (i...(N - 1)).each do |j|
    rs << DS[i..j].sum
  end
  puts rs.join(' ')
end
