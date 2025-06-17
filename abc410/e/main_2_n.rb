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

# N = STDIN.gets.chomp.to_i
N, H, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def next_board(board, h, m)
  (0...(board.length)).map do |i|
    (board[i + h] || 0) | ((board[i] || 0) >> m)
  end
end

def calc
  board = Array.new(H + 1)
  board[H] = 2 ** M

  r = 0
  ABS.each do |a, b|
    pp(a:, b:, r:) if $debug
    board = next_board(board, a, b)

    return r if board.all? { |line| line == 0 }

    r += 1
  end

  r
end




puts calc
