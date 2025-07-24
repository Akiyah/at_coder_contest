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


def creat_as
  bs = AS.map.with_index do |rows, i|
    rows.map.with_index do |a, j|
      a - PS[i + j]
    end
  end

  as = Array.new(H) { Array.new(W) }
  as[0][0] = bs[0][0]

  # i = 0
  (1...W).each do |j|
    as[0][j] = as[0][j - 1] + bs[0][j]
  end

  # j = 0
  (1...H).each do |i|
    as[i][0] = as[i - 1][0] + bs[i][0]
  end

  (1...H).each do |i|
    (1...W).each do |j|
      as[i][j] = [as[i - 1][j], as[i][j - 1]].max + bs[i][j]
    end
  end

  as
end

def calc(as, x)
  # pp(as:, x:) if $debug
  bs = Array.new(H) { Array.new(W) } # 予約
  cs = Array.new(H) { Array.new(W) } # 答え
  bs[0][0] = true
  return false if as[0][0] + x < 0

  return true if H == 1 && W == 1

  dp = []
  if 1 < H
    dp << [1, 0]
    bs[1][0] = true
  end
  if 1 < W
    dp << [0, 1]
    bs[0][1] = true
  end

  while 0 < dp.length
    pp(dp:, cs:) if $debug
    i, j = dp.shift
    next if as[i][j] + x < 0

    return true if i == H - 1 && j == W - 1

    if i + 1 < H && !bs[i + 1][j]
      dp << [i + 1, j]
      bs[i + 1][j] = true
    end
    if j + 1 < W && !bs[i][j + 1]
      dp << [i, j + 1]
      bs[i][j + 1] = true
    end
  end
 
  false
end

as = creat_as
MAX_X = (10 ** 9) * (H + W - 1)
pp(MAX_X:) if $debug
x = (0..MAX_X).bsearch do |x|
  r = calc(as, x)
  pp(x:, r:) if $debug
  r
end
pp(x:) if $debug
puts x

