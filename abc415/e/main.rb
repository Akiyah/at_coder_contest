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

pp(H:, W:, AS:, PS:) if $debug

def calc
  if H < W # Wのほうが大きいということにする
    h, w = H, W
    as = AS
  else
    h, w = W, H
    as = AS.transpose
  end

  pp(h:, w:, as:) if $debug

  dp = [[0, 0]] # [i, j]の形式の配列
  cs = Array.new(H) { Array.new(W) }
  coin = as[0][0] - PS[0]
  cs[0][0] = [coin, coin] # coin, min_coin
  i = 0

  while true
    i, j = dp.shift
    i = ij / w
    j = ij % w

    
    if 0 <= i - 1 &&  0 <= j - 1
      coin1, min_coin1 = cs[i - 1][j]
      coin2, min_coin2 = cs[i][j - 1]
    elsif 0 <= i - 1
      coin, min_coin = cs[i - 1][j]
    else # 0 <= j - 1
      coin, min_coin = cs[i][j - 1]
    end

    cs[i][j] = as[i][j] - PS[i + j]

    dp << [i + 1, j] if i + 1 < h
    dp << [i, j + 1] if j + 1 < w
  end

end




puts calc

