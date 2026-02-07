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

T = STDIN.gets.chomp.to_i


def calc(n, c, board)
  pp(n:, c:, board:) if $debug
  puts board if $debug
  low = []
  board.each.with_index do |line, i|
    line.chars.each.with_index do |s, j|
      low[j] = i if s == '#'
    end
  end
  pp(low:) if $debug

  dp = Array.new(n) { Array.new(n) }
  n.times { |i| dp[i][c] = true }

  ((n - 2)..0).step(-1).each do |i|
    line = board[i]
    n.times do |j|
      c = line[j]

      next if dp[i][j]
      ok = false

      ok = true if dp[i + 1][j]
      ok = true if 0 < j && dp[i + 1][j - 1]
      ok = true if j + 1 < n && dp[i + 1][j + 1]

      if ok
        if c == '.'
          dp[i][j] = true
        else
          if low[j] == i
            (0..i).each do |k|
              dp[k][j] = true
            end
          end
        end
      end
    end
  end

  pp(dp:) if $debug
  dp[0].map { |b| b ? '1' : '0' }.join('')
end


T.times do
  n, c = STDIN.gets.chomp.split.map(&:to_i)
  board = (1..n).map do
    STDIN.gets.chomp
  end

  puts calc(n, c - 1, board)
end
