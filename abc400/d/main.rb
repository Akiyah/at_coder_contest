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
SS = (1..H).map do
  STDIN.gets.chomp.split('').map { |s| s == '.' }
end

A, B, C, D = STDIN.gets.chomp.split.map(&:to_i)

def build_next(board, queue, l, (i, j), (di, dj))
  i1, j1 = i + di, j + dj
  i2, j2 = i1 + di, j1 + dj

  return unless 0 <= i1 && i1 < H && 0 <= j1 && j1 < W
    
  if SS[i1][j1] # '.'
    if !board[i1][j1] || l < board[i1][j1]
      queue[board[i1][j1]].delete(i1 * W + j1) if board[i1][j1]

      board[i1][j1] = l
      # pq.push([l, i1, j1])
      queue[l] << i1 * W + j1
    end
    return
  end

  # '#'
  if !board[i1][j1] || l + 1 < board[i1][j1]
    queue[board[i1][j1]].delete(i1 * W + j1) if board[i1][j1]

    board[i1][j1] = l + 1
    # pq.push([l + 1, i1, j1])
    queue[l + 1] << i1 * W + j1
  end

  return unless 0 <= i2 && i2 < H && 0 <= j2 && j2 < W

  if !board[i2][j2] || l + 1 < board[i2][j2]
    queue[board[i2][j2]].delete(i2 * W + j2) if board[i2][j2]

    board[i2][j2] = l + 1
    # pq.push([l + 1, i2, j2])
    queue[l + 1] << i2 * W + j2
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
  # pq = AcLibraryRb::PriorityQueue.new {|x, y| x[0] < y[0] }
  queue = []
  queue[0] ||= Set.new
  queue[1] ||= Set.new
  queue[0] << (A - 1) * W + (B - 1)

  board = Array.new(H) { Array.new(W) }
  board[A - 1][B - 1] = 0

  l = 0
  while true
    # pp pq if $debug
    pp queue if $debug
    while queue[l].empty?
      l += 1
      queue[l] ||= Set.new
      queue[l + 1] ||= Set.new
    end

    ij = queue[l].first
    queue[l].delete(ij)
    i = ij / W
    j = ij % W

    if board[i][j] < l
      next
    end

    build_next(board, queue, l, [i, j], [-1,  0])
    build_next(board, queue, l, [i, j], [ 1,  0])
    build_next(board, queue, l, [i, j], [ 0, -1])
    build_next(board, queue, l, [i, j], [ 0,  1])

    puts board_to_s(board, i, j) if $debug

    if board[C - 1][D - 1] && board[C - 1][D - 1] <= l
      return board[C - 1][D - 1]
    end
  end

  board[C - 1][D - 1]
end



puts calc()

