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
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


abcds = ABS.map do |a, b|
  [a, b, true, a - b]
end


def calc_ij(abcds) # 最小区間を出す
  pp(abcds:) if $debug
  i0 = 0
  i_min = nil
  j_min = nil
  sum = 0
  sum_min = 0
  N.times do |j|
    pp(j:, i0:, i_min:, j_min:, sum:, sum_min:) if $debug
    a, b, c, d = abcds[j]
    sum += d
    if d < sum
      sum = d
      i0 = j
    end
    if sum < sum_min
      sum_min = sum
      i_min = i0
      j_min = j
    end
  end

  [i_min, j_min, sum_min]
end



def calc(abcds)
  K.times do
    i, j, sum = calc_ij(abcds)
    pp(i:, j:, sum:) if $debug

    if 0 <= sum
      return abcds
    end

    (i..j).each do |k|
      abcds[k][2] = !abcds[k][2]
      abcds[k][3] = -abcds[k][3]
    end
  end
  abcds
end



abcds = calc(abcds)
pp(abcds:) if $debug
puts abcds.map { |a, b, c, d| c ? a : b }.sum

