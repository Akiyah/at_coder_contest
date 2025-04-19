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

# N = STDIN.gets.chomp.to_i
N, X = STDIN.gets.chomp.split.map(&:to_i)
SCPS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

$scps = SCPS.sort_by { |s, c, p| s * p / c }.reverse
pp $scps if $debug



def calc_expected_value_i(x, qs, q_count, i) # i門を選んだ場合の期待値
  s, c, p = $scps[i]

  return 0 if x < c # 問題を解くお金を持っていない

  # 不正解の期待値
  rx = calc_expected_value(x - c, qs, q_count)

  # 正解の期待値
  qs2 = qs.dup
  qs2[i] = true
  ro = calc_expected_value(x - c, qs2, q_count - 1)

  p0 = p / 100.0
  rx * (1 - p0) + (ro + s) * p0
end



def calc_expected_value(x, qs, q_count) # qs: 残問題、Nこのbooleanの配列
  pp [x, qs, q_count] if $debug
  return 0 if q_count == 0


  rs = []
  N.times do |i|
    next if qs[i] # すでにその問題はとき終わっている

    s, c, p = $scps[i]
    next if x < c # 問題を解くお金を持っていない

    # 不正解の期待値
    rx = calc_expected_value(x - c, qs, q_count)

    # 正解の期待値
    qs2 = qs.dup
    qs2[i] = true
    ro = calc_expected_value(x - c, qs2, q_count - 1)

    p0 = p / 100.0
    return rx * (1 - p0) + (ro + s) * p0

    # rs << calc_expected_value_i(x, qs, q_count, i) # i門を選んだ場合の期待値
  end

  #rs.max # 一番期待値が高いものを返す
  0
end


qs = {}
q_count = N
N.times { |i| qs[i] = false } # 最初は問題を解いていない

puts calc_expected_value(X, qs, q_count) # qs: 残問題、Nこのbooleanの配列

