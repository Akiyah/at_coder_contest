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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
pp(N:, K:, AS:) if $debug

def calc

  h = { 0 => -1 }
  r = 0
  sum_a = 0
  AS.each.with_index do |a, i|
    sum_a += a
    j = sum_a % K
    pp(a:, i:, j:, h:) if $debug

    if a == 0 # 単独でカッコにできる
      r += 1
      pp(r:) if $debug
      h = { 0 => i } # reset
      sum_a = 0
    else
      pp(a:, i:, sum_a:, 'sum_a % K' => sum_a % K) if $debug
      if h[j] # 対応するカッコ'('がある場合
        r += 1
        pp(r:) if $debug
        h = { 0 => i } # reset
        sum_a = 0
      else # 対応するカッコ'('がない場合
        h[j] = i # カッコの候補をスタートする
      end
    end

    pp(h:) if $debug
  end

  r
end



puts calc





# 30 8
# 5 (0) 4 2 7 (3 2 3) 2 4 (0) 1 4 (0) 4 (1 7) 5 2 5 (0) 3 6 (6 2) 3 2 (2 4 2)
# 5 (0) (4 2 7 3) 2 3 2 4 (0) 1 4 (0) 4 (1 7) 5 2 5 (0) 3 6 (6 2) 3 2 (2 4 2)
