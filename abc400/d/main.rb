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
  STDIN.gets.chomp.split('')
end

A, B, C, D = STDIN.gets.chomp.split.map(&:to_i)

def calc()
  pq = AcLibraryRb::PriorityQueue.new {|x, y| x[0] < y[0] }
  pq.push([0, A - 1, B - 1])

  board = (1..H).map { [] }
  board[A - 1][B - 1] = 0

  while !pq.empty?
    pp pq if $debug
    d, i, j = pq.pop

    if i == C - 1 && j == D - 1 && board[i][j] <= d
      return d
    end

    if board[i][j] != nil && board[i][j] < d
      next
    end

    # up
    if 0 <= i - 2
      if SS[i - 1][j] == '.'
        if board[i - 1][j] == nil || d < board[i - 1][j]
          board[i - 1][j] = d
          pq.push([d, i - 1, j])
        end
        if SS[i - 2][j] == '.'
          if board[i - 2][j] == nil || d < board[i - 2][j]
            board[i - 2][j] = d
            pq.push([d, i - 2, j])
          end
        else
          if board[i - 2][j] == nil || d + 1 < board[i - 2][j]
            board[i - 2][j] = d + 1
            pq.push([d + 1, i - 2, j])
          end
        end
      else
        if board[i - 1][j] == nil || d + 1 < board[i - 1][j]
          board[i - 1][j] = d + 1
          pq.push([d + 1, i - 1, j])
        end
        if board[i - 2][j] == nil || d + 1 < board[i - 2][j]
          board[i - 2][j] = d + 1
          pq.push([d + 1, i - 2, j])
        end
      end
    elsif 0 <= i - 1
      if SS[i - 1][j] == '.'
        if board[i - 1][j] == nil || d < board[i - 1][j]
          board[i - 1][j] = d
          pq.push([d, i - 1, j])
        end
      else
        if board[i - 1][j] == nil || d + 1 < board[i - 1][j]
          board[i - 1][j] = d + 1
          pq.push([d + 1, i - 1, j])
        end
      end
    end

    # down
    if i + 2 < H
      if SS[i + 1][j] == '.'
        if board[i + 1][j] == nil || d < board[i + 1][j]
          board[i + 1][j] = d
          pq.push([d, i + 1, j])
        end
        if SS[i + 2][j] == '.'
          if board[i + 2][j] == nil || d < board[i + 2][j]
            board[i + 2][j] = d
            pq.push([d, i + 2, j])
          end
        else
          if board[i + 2][j] == nil || d + 1 < board[i + 2][j]
            board[i + 2][j] = d + 1
            pq.push([d + 1, i + 2, j])
          end
        end
      else
        if board[i + 1][j] == nil || d + 1 < board[i + 1][j]
          board[i + 1][j] = d + 1
          pq.push([d + 1, i + 1, j])
        end
        if board[i + 2][j] == nil || d + 1 < board[i + 2][j]
          board[i + 2][j] = d + 1
          pq.push([d + 1, i + 2, j])
        end
      end
    elsif i + 1 < H
      if SS[i + 1][j] == '.'
        if board[i + 1][j] == nil || d < board[i + 1][j]
          board[i + 1][j] = d
          pq.push([d, i + 1, j])
        end
      else
        if board[i + 1][j] == nil || d + 1 < board[i + 1][j]
          board[i + 1][j] = d + 1
          pq.push([d + 1, i + 1, j])
        end
      end
    end

    # left
    if 0 <= j - 2
      if SS[i][j - 1] == '.'
        if board[i][j - 1] == nil || d < board[i][j - 1]
          board[i][j - 1] = d
          pq.push([d, i, j - 1])
        end
        if SS[i][j - 2] == '.'
          if board[i][j - 2] == nil || d < board[i][j - 2]
            board[i][j - 2] = d
            pq.push([d, i, j - 2])
          end
        else
          if board[i][j - 2] == nil || d + 1 < board[i][j - 2]
            board[i][j - 2] = d + 1
            pq.push([d + 1, i, j - 2])
          end
        end
      else
        if board[i][j - 1] == nil || d + 1 < board[i][j - 1]
          board[i][j - 1] = d + 1
          pq.push([d + 1, i, j - 1])
        end
        if board[i][j - 2] == nil || d + 1 < board[i][j - 2]
          board[i][j - 2] = d + 1
          pq.push([d + 1, i, j - 2])
        end
      end
    elsif 0 <= j - 1
      if SS[i][j - 1] == '.'
        if board[i][j - 1] == nil || d < board[i][j - 1]
          board[i][j - 1] = d
          pq.push([d, i, j - 1])
        end
      else
        if board[i][j - 1] == nil || d + 1 < board[i][j - 1]
          board[i][j - 1] = d + 1
          pq.push([d + 1, i, j - 1])
        end
      end
    end

    # right
    if j + 2 < W
      if SS[i][j + 1] == '.'
        if board[i][j + 1] == nil || d < board[i][j + 1]
          board[i][j + 1] = d
          pq.push([d, i, j + 1])
        end
        if SS[i][j + 2] == '.'
          if board[i][j + 2] == nil || d < board[i][j + 2]
            board[i][j + 2] = d
            pq.push([d, i, j + 2])
          end
        else
          if board[i][j + 2] == nil || d + 1 < board[i][j + 2]
            board[i][j + 2] = d + 1
            pq.push([d + 1, i, j + 2])
          end
        end
      else
        if board[i][j + 1] == nil || d + 1 < board[i][j + 1]
          board[i][j + 1] = d + 1
          pq.push([d + 1, i, j + 1])
        end
        if board[i][j + 2] == nil || d + 1 < board[i][j + 2]
          board[i][j + 2] = d + 1
          pq.push([d + 1, i, j + 2])
        end
      end
    elsif j + 1 < W
      if SS[i][j + 1] == '.'
        if board[i][j + 1] == nil || d < board[i][j + 1]
          board[i][j + 1] = d
          pq.push([d, i, j + 1])
        end
      else
        if board[i][j + 1] == nil || d + 1 < board[i][j + 1]
          board[i][j + 1] = d + 1
          pq.push([d + 1, i, j + 1])\
        end
      end
    end
  end

  board[C - 1][D - 1]
end



puts calc()

