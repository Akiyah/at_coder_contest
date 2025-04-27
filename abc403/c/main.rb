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

N, M, Q = STDIN.gets.chomp.split.map(&:to_i)
QUERYS = (1..Q).map do
  STDIN.gets.chomp.split
end


k1s = {}
k2s = {}

QUERYS.each do |t, x, y|
  if t == '1'
    k1s[x] ||= {}
    k1s[x][y] = true
  elsif t == '2'
    k2s[x] = true
  else
    r = k2s[x] || (k1s[x] && k1s[x][y])
    puts (r ? 'Yes' : 'No')
  end
end
