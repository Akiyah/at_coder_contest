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

as = AS.map.with_index do |rows, i|
  rows.map.with_index do |a, j|
    a - PS[i + j]
  end
end

pp(H:, W:, AS:, PS:, as:) if $debug

def calc(as, x)
  # pp(as:, x:) if $debug
  bs = Array.new(H) { Array.new(W) } # 予約
  cs = Array.new(H) { Array.new(W) } # 答え
  bs[0][0] = true
  cs[0][0] = as[0][0] + x
  return false if cs[0][0] < 0

  return true if H == 1 && W == 1

  dp = []
  dp << [1, 0] if 1 < H
  dp << [0, 1] if 1 < W


  while 0 < dp.length
    pp(dp:, cs:) if $debug
    i, j = dp.shift
    c1 = (0 <= i - 1) ? (cs[i - 1][j] || 0) : 0
    c2 = (0 <= j - 1) ? (cs[i][j - 1] || 0) : 0
    c = [c1, c2].max + as[i][j]
    next if c < 0

    return true if i == H - 1 && j == W - 1

    cs[i][j] = c

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


MAX_X = (10 ** 9) * (H + W - 1)
pp(MAX_X:) if $debug
x = (0..MAX_X).bsearch do |x|
  r = calc(as, x)
  pp(x:, r:) if $debug
  r
end
pp(x:) if $debug
puts x

