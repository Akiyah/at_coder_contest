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

H, W = STDIN.gets.chomp.split.map(&:to_i)
AS = (1..H).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



def calc_one(m, board, cells, i0, j0)
  # pp(m:, board:, cells:) if $debug
  # pp(m:) if $debug
  r = m

  cells.each do |i, j|
    next if i < i0 || (i == i0 && j <= j0)
    if i + 1 < H && board[i][j] && board[i + 1][j]
      a1 = AS[i][j]
      a2 = AS[i + 1][j]
      board2 = board.map { |line| line.dup }
      board2[i][j] = false
      board2[i + 1][j] = false
      cells2 = cells - [[i, j], [i + 1, j]]
      r2 = calc_one(m ^ a1 ^ a2, board2, cells2, i, j)
      r = r2 if r < r2
    end
    if j + 1 < W && board[i][j] && board[i][j + 1]
      a1 = AS[i][j]
      a2 = AS[i][j + 1]
      board2 = board.map { |line| line.dup }
      board2[i][j] = false
      board2[i][j + 1] = false
      cells2 = cells - [[i, j], [i, j + 1]]
      r2 = calc_one(m ^ a1 ^ a2, board2, cells2, i, j)
      r = r2 if r < r2
    end
  end

  r
end


def calc
  m = AS.flatten.inject(:^)
  board = Array.new(H) { Array.new(W, true) }
  cells = []
  H.times do |i|
    W.times do |j|
      cells << [i, j]
    end
  end

  calc_one(m, board, cells, -1, 0)
end




puts calc()


