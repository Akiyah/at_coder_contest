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

10.times do

  board2 = []
  H.times do |i|
    line = W.times.map do |j|
      if board[i][j]
        false
      else
        b = false
        b = true if 0 <= i - 1 && 0 <= j - 1 && board[i - 1][j - 1] 
        b = true if 0 <= i - 1 && board[i - 1][j] 
        b = true if 0 <= i - 1 && j + 1 < W && board[i - 1][j + 1] 

        b = true if 0 <= j - 1 && board[i][j - 1] 
        b = true if j + 1 < W && board[i][j + 1] 

        b = true if i + 1 < H && 0 <= j - 1 && board[i + 1][j - 1] 
        b = true if i + 1 < H && board[i + 1][j] 
        b = true if i + 1 < H && j + 1 < W && board[i + 1][j + 1] 
        b
      end
    end
    board2 << line
  end

  board = board2
  pp(board:) if $debug
  puts show(board) if $debug

end





