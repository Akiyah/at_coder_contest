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

sheets = {}
LRS.each.with_index do |(l1, r1), i1|
  LRS.each.with_index do |(l2, r2), i2|
    next if i1 == i2
    if l1 <= l2 && l2 <= r1 + 1 # 重なっている
      pp(l1:, r1:, l2:, r2:) if $debug
      r = r1 < r2 ? r2 : r1
      sheets[l1] ||= {}
      sheets[l1][r] = true
    end
  end
end
pp(sheets:) if $debug

STS.each do |s, t|
  ans = sheets[s] && sheets[s][t]
  puts ans ? 'Yes' : 'No'
end


