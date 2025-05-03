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

paths = {}
ABS.each do |a, b|
  paths[a] ||= []
  paths[b] ||= []
  paths[a] << b
  paths[b] << a
end

def check(paths)
  rs = []

  a = 1
  rs << a
  return false if !paths[a] || paths[a].length != 2
  b = paths[a][0]

  a_last = a
  b_last = b

  (N - 1).times do
    a = b_last
    rs << a
    return false if !paths[a] || paths[a].length != 2
    b = paths[a][0]
    if b == a_last
      b = paths[a][1]
    end

    a_last = a
    b_last = b
  end

  return false if b_last != 1

  pp rs if $debug
  rs.uniq.length == N
end


puts check(paths) ? 'Yes' : 'No'
