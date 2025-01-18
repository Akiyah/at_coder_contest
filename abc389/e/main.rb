#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)
PS2 = PS.sort

# 一番高いものを買って良い数
k_min = (0..(10**9)).bsearch do |k|
  p_max = PS2[-1].to_f
  M < PS2.map { |p| ((k * Math.sqrt(p_max / p)).floor ** 2) * p }.sum
end


pp({k_min:}) if $debug

def calc(k_min)
  p_max = PS2[-1].to_f
  rs = PS2.map { |p| (k_min * Math.sqrt(p_max / p)).floor }
  pp({PS2:, rs:})

  m = M
  rs.each_with_index do |r, i|
    m -= PS2[i] * (r ** 2)
  end

  while true
    qs = (0...N).map do |i|
      k = rs[i] + 1
      q = PS2[i] * (2 * k - 1) 
      [q, i]
    end

    q = qs.min_by {|q| q[0]}
    j = q[1]

    if m < q[0]
      pp rs if $debug
      return rs.sum
    end

    m -= q[0]
    rs[j] += 1
  end
end

puts calc(k_min - 1)


