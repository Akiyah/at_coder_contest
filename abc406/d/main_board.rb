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

H, W, N = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
QUERIES = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


board = {}

count_columns = Array.new(H, 0)
count_rows = Array.new(W, 0)

XYS.each do |x, y|
  x -= 1
  y -= 1
  count_columns[x] += 1
  count_rows[y] += 1
  board[x] ||= {}
  board[x][y] = true
end

pp(board:, count_columns:, count_rows:) if $debug

QUERIES.each do |t, i|
  if t == 1
    x = i - 1
    puts count_columns[x]

    count_columns[x] = 0
    if board[x]
      board[x].keys.each do |y|
        count_rows[y] -= 1
      end
    end
    board[x] = nil
  else # t == 2
    y = i - 1
    puts count_rows[y]

    count_rows[y] = 0
    board.each do |x, ys|
      if ys && ys[y]
        ys[y] = nil
        count_columns[x] -= 1
      end
    end
  end

  pp(board:, count_columns:, count_rows:) if $debug
end

