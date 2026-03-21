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
  STDIN.gets.chomp.chars.map { |c| c == '.' }
end

# pp(SS:) if $debug

def calc_one(ss, i0, j0)
  pp(method: 'calc_one', i0:, j0:) if $debug
  in_black = true

  dp = []
  dp << [i0, j0]
  ss[i0][j0] = false

  while 0 < dp.length
    pp(dp:, in_black:) if $debug
    i, j = dp.shift
    # pp(i:, j:) if $debug

    if i == 0 || j == 0 || i == H - 1 || j == W - 1
      in_black = false
    end
    if 0 <= i - 1 && ss[i - 1][j]
      dp << [i - 1, j]
      ss[i - 1][j] = false
    end    
    if 0 <= j - 1 && ss[i][j - 1]
      dp << [i, j - 1]
      ss[i][j - 1] = false
    end
    if i + 1 < H && ss[i + 1][j]
      dp << [i + 1, j]
      ss[i + 1][j] = false
    end
    if j + 1 < W && ss[i][j + 1]
      dp << [i, j + 1]
      ss[i][j + 1] = false
    end
  end

  pp(in_black:) if $debug
  in_black
end


def calc
  ss = SS.dup

  points = []
  SS.each.with_index do |line, i|
    line.each.with_index do |c, j|
      points << [i, j] if c
    end
  end
  # pp(points:) if $debug

  ans = 0
  points.each do |i, j|
    if ss[i][j]
      r = calc_one(ss, i, j)
      if r
        ans += 1
        pp(ss:, i:, j:) if $debug
      end
    end
  end


  ans
end


puts calc
