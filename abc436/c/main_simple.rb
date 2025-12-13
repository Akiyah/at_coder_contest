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

x = 0
board = Array.new(N) { Array.new(N) }

RCS.each do |r, c|
  unless board[r][c] || board[r + 1][c] || board[r][c + 1] || board[r + 1][c + 1]
    board[r][c] = true
    board[r + 1][c] = true
    board[r][c + 1] = true
    board[r + 1][c + 1] = true
    x += 4
  end
end

puts x
