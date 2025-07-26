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
  STDIN.gets.chomp.split.map(&:to_i)
end
PS = STDIN.gets.chomp.split.map(&:to_i)


def creat_bs
  H.times.map do |i|
    W.times.map do |j|
      AS[i][j] - PS[i + j]
    end
  end
end

def calc(bs, x)
  pp(bs:, x:, AS:, PS:) if $debug
  cs = Array.new(H) { Array.new(W) } # 結果

  cs[0][0] = x + bs[0][0]
  return false if cs[0][0] < 0
  return true if 0 == H - 1 && 0 == W - 1 # goal

  dp = []
  if 1 < H
    new_c = cs[0][0] + bs[1][0]
    if 0 <= new_c
      cs[1][0] = new_c
      dp << [1, 0]
    end
  end
  if 1 < W
    new_c = cs[0][0] + bs[0][1]
    if 0 <= new_c
      cs[0][1] = new_c
      dp << [0, 1]
    end
  end

  while 0 < dp.length
    pp(dp:, cs:) if $debug
    i, j = dp.shift

    next if cs[i][j] < 0

    return true if i == H - 1 && j == W - 1 # goal

    if i + 1 < H
      new_c = cs[i][j] + bs[i + 1][j]
      if 0 <= new_c
        old_c = cs[i + 1][j]
        if old_c
          cs[i + 1][j] = new_c if old_c < new_c
        else
          cs[i + 1][j] = new_c
          dp << [i + 1, j]
        end
      end
    end
    if j + 1 < W
      new_c = cs[i][j] + bs[i][j + 1]
      if 0 <= new_c
        old_c = cs[i][j + 1]
        if old_c
          cs[i][j + 1] = new_c if old_c < new_c
        else
          cs[i][j + 1] = new_c
          dp << [i, j + 1]
        end
      end
    end
  end
 
  false
end

bs = creat_bs
MAX_X = (10 ** 9) * (H + W - 1)
pp(MAX_X:) if $debug
x = (0..MAX_X).bsearch do |x|
  r = calc(bs, x)
  pp(x:, r:) if $debug
  r
end
pp(x:) if $debug
puts x

