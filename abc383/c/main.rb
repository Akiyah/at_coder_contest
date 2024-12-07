#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


H, W, D = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.split('')
end

pp [H, W, D, SS] if $debug

def update(i, j, di, dj, d, board)
  return false unless 0 <= i + di && i + di < H
  return false unless 0 <= j + dj && j + dj < W
  return false unless SS[i + di][j + dj] == '.'

  # pp [board[i + di][j + dj], d] if $debug
  return false unless board[i + di][j + dj] == nil || board[i + di][j + dj] < d

  board[i + di][j + dj] = d
  true
end

def calc
  hs = []
  board = []
  (0...H).each do |i|
    board[i] = []
    (0...W).each do |j|
      if SS[i][j] == 'H'
        hs << [i, j]
        board[i][j] = D
      end
    end
  end

  pp hs if $debug
  pp board if $debug

  hs_new = []
  (0...D).to_a.reverse.each do |d|
    pp [d, hs] if $debug
    hs_new = []
    hs.each do |i, j|
      hs_new << [i + 1, j] if update(i, j, 1, 0, d, board)
      hs_new << [i - 1, j] if update(i, j, -1, 0, d, board)
      hs_new << [i, j + 1] if update(i, j, 0, 1, d, board)
      hs_new << [i, j - 1] if update(i, j, 0, -1, d, board)
      pp [i, j, hs_new] if $debug
    end
    hs = hs_new
    pp board if $debug
  end

  # pp board if $debug

  board.sum { |line| line.compact.count }
end


puts calc