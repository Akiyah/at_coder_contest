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
  STDIN.gets.chomp
end


board = SS.map do |s|
  s.chars.map { |c| c == '#' }
end


def show(board)
  board.map do |line|
    line.map { |b| b ? '#' : '.' }.join('')
  end.join("\n")
end

pp(board:) if $debug
puts show(board) if $debug

board2 = H.times.map do |i|
  line = W.times.map do |j|
    if board[i][j]
      false
    else
      b = false
      b = true if 0 <= i - 1 && 0 <= j - 1 && board[i - 1][j - 1] 
      b = true if 0 <= i - 1               && board[i - 1][j] 
      b = true if 0 <= i - 1 && j + 1 < W  && board[i - 1][j + 1] 

      b = true if 0 <= j - 1 && board[i][j - 1] 
      b = true if j + 1 < W  && board[i][j + 1] 

      b = true if i + 1 < H && 0 <= j - 1 && board[i + 1][j - 1] 
      b = true if i + 1 < H               && board[i + 1][j] 
      b = true if i + 1 < H && j + 1 < W  && board[i + 1][j + 1] 
      b
    end
  end
end



pp(board2:) if $debug
puts show(board2) if $debug



def calc_board3(board2)
  board3 = Array.new(H) { Array.new(W) }

  dp = []
  H.times do |i|
    W.times do |j|
      if board2[i][j]
        board3[i][j] = 1
        n = 1
        dp << [i - 1, j - 1, n + 1] if 0 <= i - 1 && 0 <= j - 1 && !board3[i - 1][j - 1]
        dp << [i - 1, j, n + 1]     if 0 <= i - 1               && !board3[i - 1][j] 
        dp << [i - 1, j + 1, n + 1] if 0 <= i - 1 && j + 1 < W  && !board3[i - 1][j + 1] 

        dp << [i, j - 1, n + 1] if 0 <= j - 1 && !board3[i][j - 1] 
        dp << [i, j + 1, n + 1] if j + 1 < W  && !board3[i][j + 1] 

        dp << [i + 1, j - 1, n + 1] if i + 1 < H && 0 <= j - 1 && !board3[i + 1][j - 1] 
        dp << [i + 1, j, n + 1]     if i + 1 < H               && !board3[i + 1][j] 
        dp << [i + 1, j + 1, n + 1] if i + 1 < H && j + 1 < W  && !board3[i + 1][j + 1] 
      end
    end
  end

  pp(dp:) if $debug
  pp(board3:) if $debug
  while 0 < dp.length
    i, j, n = dp.shift
    pp(i:, j:, n:) if $debug
    if board3[i][j] == nil
      board3[i][j] = n

      dp << [i - 1, j - 1, n + 1] if 0 <= i - 1 && 0 <= j - 1 && !board3[i - 1][j - 1]
      dp << [i - 1, j,     n + 1] if 0 <= i - 1               && !board3[i - 1][j] 
      dp << [i - 1, j + 1, n + 1] if 0 <= i - 1 && j + 1 < W  && !board3[i - 1][j + 1] 

      dp << [i, j - 1,     n + 1] if 0 <= j - 1 && !board3[i][j - 1] 
      dp << [i, j + 1,     n + 1] if j + 1 < W  && !board3[i][j + 1] 

      dp << [i + 1, j - 1, n + 1] if i + 1 < H && 0 <= j - 1 && !board3[i + 1][j - 1] 
      dp << [i + 1, j,     n + 1] if i + 1 < H               && !board3[i + 1][j] 
      dp << [i + 1, j + 1, n + 1] if i + 1 < H && j + 1 < W  && !board3[i + 1][j + 1] 
    end

    pp(dp:) if $debug
    pp(board3:) if $debug
  end

  board3
end



board3 = calc_board3(board2)
pp(board3:) if $debug


board4 = H.times.map do |i|
  W.times.map do |j|
    if board3[i][j]
      board3[i][j] % 2 == 0 ? '#' : '.'
    else
      '.'
    end
  end
end

board4.each do |line|
  puts line.join('')
end