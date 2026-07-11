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
RCS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

board = Array.new(N) { Array.new(N) }
RCS.each do |r, c|
  N.times { |i| board[i][c - 1] = false }
  N.times { |j| board[r - 1][j] = false }
  board[r - 1][c - 1] = true
end

r = 0
N.times do |i|
  N.times do |j|
    r += 1 if board[i][j]
  end
end

puts r
