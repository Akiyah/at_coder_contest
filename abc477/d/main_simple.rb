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
QUERIES = Q.times.map do
  a, b = STDIN.gets.chomp.split
  [a, b]
end

board = ['a'] * N
tiles = [false] * N

QUERIES.each do |a, b|
  pp(a:, b:) if $debug
  if a == '1'
    x = b.to_i - 1
    tiles[x] = !tiles[x]
  else
    c = b
    tiles.each.with_index do |t, i|
      if !t
        board[i] = c
      end
    end
  end
  pp(board:, tiles:) if $debug
end

puts board.join()
