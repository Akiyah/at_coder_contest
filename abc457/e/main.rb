#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
STS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def create_sheets()
  lris = LRS.map.with_index { |(l, r), i| [l, r, i] }
  lris_l = lris.sort_by { |l, r, i| l }
  lris_r = lris.sort_by { |l, r, i| r }
  pp(lris_l:) if $debug
  pp(lris_r:) if $debug

  il = 0
  ir = 0
  sheets = {}
  while true
    l1, r1, i1 = lris_r[ir]
    pp(ir:, l1:, r1:, i1:) if $debug

    l2, r2, i2 = lris_l[il]
    pp(il:, l2:, r2:, i2:) if $debug
    while l2 <= r1 + 1 # 繋がっている
      if il != ir && l1 <= r2 + 1 # 左を見ても確かに重なっている
        l = l1 < l2 ? l1 : l2
        r = r1 < r2 ? r2 : r1
        pp(l:, r:) if $debug
        sheets[l] ||= {}
        sheets[l][r] = true
      end

      il += 1
      return sheets if M <= il
      l2, r2, i2 = lris_l[il]
      pp(il:, l2:, r2:, i2:) if $debug
    end

    ir += 1
    return sheets if M <= ir
  end
end

sheets = create_sheets()
pp(sheets:) if $debug

STS.each do |s, t|
  ans = sheets[s] && sheets[s][t]
  puts ans ? 'Yes' : 'No'
end


