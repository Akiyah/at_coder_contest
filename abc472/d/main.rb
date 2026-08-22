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

H, W, K = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp
end

board = Array.new(H) { Array.new(W, 0) }
b_rows = Array.new(H, nil)
b_cols = Array.new(W, nil)
SS.each.with_index do |line, i|
  line.chars.each.with_index do |c, j|
    if c == '#'
      board[i][j] = -1
      b_rows[i] = true
      b_cols[j] = true
    else
      # board[i][j] = nil
    end
  end
end

b_rows.each.with_index do |b, i|
  W.times do |j|
    board[i][j] = nil if b && board[i][j] != -1
  end
end

b_cols.each.with_index do |b, j|
  H.times do |i|
    board[i][j] = nil if b && board[i][j] != -1
  end
end

pp(board:, b_rows:, b_cols:) if $debug


dp = {}
r = 0
board.each.with_index do |line, i|
  line.each.with_index do |c, j|
    if c == 0
      dp[i] ||= {}
      dp[i][j] = true
      r += 1
    end
  end
end


K.times do |k|
  new_dp = {}

  dp.each do |i, dpj|
    dpj.each do |j, b|
      if i + 1 < H && board[i + 1][j] == nil
        new_dp[i + 1] ||= {}
        unless new_dp[i + 1][j]
          new_dp[i + 1][j] = true
          board[i + 1][j] = k
          r += 1
        end
      end
      if 0 <= i - 1 && board[i - 1][j] == nil
        new_dp[i - 1] ||= {}
        unless new_dp[i - 1][j]
          new_dp[i - 1][j] = true
          board[i - 1][j] = k
          r += 1
        end
      end
      if j + 1 < W && board[i][j + 1] == nil
        new_dp[i] ||= {}
        unless new_dp[i][j + 1]
          new_dp[i][j + 1] = true
          board[i][j + 1] = k
          r += 1
        end
      end
      if 0 <= j - 1 && board[i][j - 1] == nil
        new_dp[i] ||= {}
        unless new_dp[i][j - 1]
          new_dp[i][j - 1] = true
          board[i][j - 1] = k
          r += 1
        end
      end
    end

    dp = new_dp
  end

  r
end





puts r
