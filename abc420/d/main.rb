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
  STDIN.gets.chomp.split('')
end

def movable?(i, j, t)
  AS[i][j] == '.' || AS[i][j] == '?' || AS[i][j] == 'S' || AS[i][j] == 'G' || (AS[i][j] == 'o' && t) || (AS[i][j] == 'x' && !t)
end

def calc
  start = nil
  goal = nil
  AS.each_with_index do |line, i|
    line.each_with_index do |a, j|
      start = [i, j] if a == 'S'
      goal = [i, j] if a == 'G'
    end
  end

  pp(start:, goal:) if $debug

  dp = []
  dp << start + [true, 0]
  board = Array.new(H) { Array.new(W) { {} } }
  pp(dp:) if $debug

  while 0 < dp.length
    i, j, t, c = dp.shift
    if 0 < i
      i_new = i - 1
      if movable?(i_new, j, t)
        t_new = (AS[i_new][j] == '?') ? !t : t
        if !board[i_new][j][t_new] || c < board[i_new][j][t_new]
          dp << [i_new, j, t_new, c + 1]
          board[i_new][j][t_new] = c
          return c + 1 if i_new == goal[0] && j == goal[1]
        end
      end
    end
    if i < H - 1
      i_new = i + 1
      if movable?(i_new, j, t)
        t_new = (AS[i_new][j] == '?') ? !t : t
        if !board[i_new][j][t_new] || c < board[i_new][j][t_new]
          dp << [i_new, j, t_new, c + 1]
          board[i_new][j][t_new] = c
          return c + 1 if i_new == goal[0] && j == goal[1]
        end
      end
    end
    if 0 < j
      j_new = j - 1
      if movable?(i, j_new, t)
        t_new = (AS[i][j_new] == '?') ? !t : t
        if !board[i][j_new][t_new] || c < board[i][j_new][t_new]
          dp << [i, j_new, t_new, c + 1]
          board[i][j_new][t_new] = c
          return c + 1 if i == goal[0] && j_new == goal[1]
        end
      end
    end
    if j < W - 1
      j_new = j + 1
      if movable?(i, j_new, t)
        t_new = (AS[i][j_new] == '?') ? !t : t
        if !board[i][j_new][t_new] || c < board[i][j_new][t_new]
          dp << [i, j_new, t_new, c + 1]
          board[i][j_new][t_new] = c
          return c + 1 if i == goal[0] && j_new == goal[1]
        end
      end
    end

    pp(dp:) if $debug
  end


  -1
end





puts calc()


