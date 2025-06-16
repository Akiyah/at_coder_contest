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



def move_up(board, h)
  # pp(board:, h:) if $debug
  if h <= H + 1
    board[h..] + Array.new(h) { Array.new(M + 1) }
  else
    Array.new(H + 1) { Array.new(M + 1) }
  end
end

def move_left(board, m)
  (0..H).map do |h|
    if m <= M + 1
      board[h][m..] + Array.new(m)
    else
      Array.new(M + 1)
    end
  end
end

def merge(board1, board2)
  (0..H).map do |h|
    (0..M).map do |m|
      board1[h][m] || board2[h][m]
    end
  end
end

def calc
  board = Array.new(H + 1) { Array.new(M + 1) }
  board[H][M] = true

  r = 0
  ABS.each do |a, b|
    pp(a:, b:, r:) if $debug
    board1 = move_up(board, a)
    board2 = move_left(board, b)
    board = merge(board1, board2)

    return r if board.all? { |line| line.all? { |c| !c } }

    r += 1
  end

  r
end




puts calc
