#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.split('').map { |s| s == '.' }
end

A, B, C, D = STDIN.gets.chomp.split.map(&:to_i)

def build_next(board, pq, l, (i, j), (di, dj))
  i1, j1 = i + di, j + dj
  i2, j2 = i1 + di, j1 + dj

  return unless 0 <= i1 && i1 < H && 0 <= j1 && j1 < W
    
  if SS[i1][j1] # '.'
    if l < board[i1][j1]
      board[i1][j1] = l
      pq.push([l, i1, j1])
    end
    return
  end

  # '#'
  if l + 1 < board[i1][j1]
    board[i1][j1] = l + 1
    pq.push([l + 1, i1, j1])
  end

  return unless 0 <= i2 && i2 < H && 0 <= j2 && j2 < W

  if l + 1 < board[i2][j2]
    board[i2][j2] = l + 1
    pq.push([l + 1, i2, j2])
  end
end

def board_to_s(board, i0, j0)
  board.map.with_index do |line, i|
    line.map.with_index do |l, j|
      next '*' if i == i0 && j == j0
      next 'S' if i == A - 1 && j == B - 1
      next 'G' if i == C - 1 && j == D - 1
      next (SS[i][j] ? '.' : '#') if l == 10000
      l
    end.join(' ')
  end.join("\n") + "\n" + '---'
end

def calc()
  pq = AcLibraryRb::PriorityQueue.new {|x, y| x[0] < y[0] }
  pq.push([0, A - 1, B - 1])

  board = Array.new(H) { Array.new(W, 10000) }
  board[A - 1][B - 1] = 0

  while !pq.empty?
    # pp pq if $debug
    l, i, j = pq.pop

    if board[i][j] < l
      next
    end

    build_next(board, pq, l, [i, j], [-1,  0])
    build_next(board, pq, l, [i, j], [ 1,  0])
    build_next(board, pq, l, [i, j], [ 0, -1])
    build_next(board, pq, l, [i, j], [ 0,  1])

    puts board_to_s(board, i, j) if $debug

    if board[C - 1][D - 1] <= l
      return board[C - 1][D - 1]
    end
  end

  board[C - 1][D - 1]
end



puts calc()

