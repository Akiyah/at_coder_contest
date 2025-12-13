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

board = Array.new(N) { Array.new(N) }

k = 1
r = 0
c = (N - 1) / 2
board[r][c] = k

(N ** 2 - 1).times do
  k1 = k + 1
  r1 = (r - 1) % N
  c1 = (c + 1) % N
  if board[r1][c1]
    r1 = (r + 1) % N
    c1 = c
  end

  board[r1][c1] = k1

  k, r, c = k1, r1, c1
end


board.each do |line|
  puts line.join(' ')
end
