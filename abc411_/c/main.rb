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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

bs = Array.new(N)
r = 0

AS.each do |a1|
  a = a1 - 1

  if bs[a] # 黒だった場合
    if (0 <= a - 1 && bs[a - 1]) && (a + 1 < N && bs[a + 1]) # 左右が黒の場合
      r += 1 # 白にして分割するので一個増える
    elsif (0 <= a - 1 && bs[a - 1]) || (a + 1 < N && bs[a + 1]) # 左右のどちらかが黒の場合
      # 数は増えない
    else
      r -= 1
    end
  else # 白の場合
    if (0 <= a - 1 && bs[a - 1]) && (a + 1 < N && bs[a + 1]) # 左右が黒の場合
      r -= 1 # 黒にして連結するので一個増える
    elsif (0 <= a - 1 && bs[a - 1]) || (a + 1 < N && bs[a + 1]) # 左右のどちらかが黒の場合
      # 数は増えない
    else
      r += 1
    end
  end

  bs[a] = !bs[a]

  puts r
end


