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
  ds = Array.new(H) { Array.new(W) } # 予約

  ds[0][0] = true
  cs[0][0] = x + bs[0][0]
  return false if cs[0][0] < 0
  return true if 0 == H - 1 && 0 == W - 1 # goal

  dp = []
  if 1 < H
    dp << [1, 0]
    ds[1][0] = true
  end
  if 1 < W
    dp << [0, 1]
    ds[0][1] = true
  end

  while 0 < dp.length
    pp(dp:, cs:, ds:) if $debug
    i, j = dp.shift

    rs = []
    rs << cs[i - 1][j] if 0 < i && cs[i - 1][j]
    rs << cs[i][j - 1] if 0 < j && cs[i][j - 1]
    c = rs.max + bs[i][j]
    next if c < 0
    cs[i][j] = c

    return true if i == H - 1 && j == W - 1 # goal

    if i + 1 < H && !ds[i + 1][j]
      dp << [i + 1, j]
      ds[i + 1][j] = true
    end
    if j + 1 < W && !ds[i][j + 1]
      dp << [i, j + 1]
      ds[i][j + 1] = true
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

