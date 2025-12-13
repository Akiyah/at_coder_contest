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
  STDIN.gets.chomp.split('')
end

warps = {}

SS.each.with_index do |line, i|
  line.each.with_index do |s, j|
    warps[s] ||= []
    warps[s] << [i, j]
  end
end

def step(i1, j1, dp_new, warps, board, step)
  return if board[i1][j1]
  s = SS[i1][j1]
  return if s == '#'

  dp_new << [i1, j1]
  board[i1][j1] = step
end

def calc(warps)
  board = Array.new(H) { Array.new(W) }
  board[0][0] = 0
  dp = [[0, 0]]
  step = 0
  pp(step:, dp:) if $debug
  while true
    dp_new = []
    dp.each do |i, j|
      return step if i == H - 1 && j == W - 1
      s = SS[i][j]
      if s != '.' && warps[s]
        warps[s].each do |i2, j2|
          next if i2 == i && j2 == j
          next if board[i2][j2]
          dp_new << [i2, j2]
          board[i2][j2] = step
        end
        warps[s] = nil # 使用ずみ
      end
      step(i + 1, j, dp_new, warps, board, step + 1) if i + 1 < H
      step(i - 1, j, dp_new, warps, board, step + 1) if 0 <= i - 1
      step(i, j + 1, dp_new, warps, board, step + 1) if j + 1 < W
      step(i, j - 1, dp_new, warps, board, step + 1) if 0 <= j - 1
    end
    
    return -1 if dp_new.length == 0
    step += 1
    dp = dp_new
    pp(step:, dp:) if $debug
  end
end


r = calc(warps)
puts r

