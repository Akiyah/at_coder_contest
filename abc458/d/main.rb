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

X = STDIN.gets.chomp.to_i
Q = STDIN.gets.chomp.to_i
ABS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


ns = []
ns << [X, nil]
ABS.each.with_index do |(a, b), i|
  ns << [a, i]
  ns << [b, i]
end

ns = ns.sort_by { |a, i| a }
ns = ns.map.with_index do |(a, i), k|
  k_1 = k - 1
  k1 = k + 1
  k_1 = nil if k_1 < 0
  k1 = nil if 2 * Q + 1 <= k1
  [a, i, [k_1, k, k1]]
end

pp(ns:) if $debug

jss = Array.new(Q) { [] }
ns.each do |a, i, ks|
  jss[i] << ks[1] if i
end

pp(jss:) if $debug
c = Q # 真ん中
rs = []
rs << ns[c][0]
jss.reverse.each do |js|
  j0, j1 = js

  # j0
  n = ns[j0]
  k_1, _, k1 = ns[j0][2]
  if k_1
    n_l = ns[k_1]
    n_l[2][2] = k1
  end
  if k1
    n_r = ns[k1]
    n_r[2][0] = k_1
  end

  # j1
  n = ns[j1]
  k_1, _, k1 = ns[j1][2]
  if k_1
    n_l = ns[k_1]
    n_l[2][2] = k1
  end
  if k1
    n_r = ns[k1]
    n_r[2][0] = k_1
  end

  if j0 <= c && j1 <= c # 右に移動
    n_c = ns[c]
    c = n_c[2][2]
  elsif c <= j0 && c <= j1 # 左に移動
    n_c = ns[c]
    c = n_c[2][0]
  end

  rs << ns[c][0]
  pp(ns:) if $debug
  pp(rs:) if $debug
end
pp(rs:) if $debug

rs.pop
rs.reverse.each do |r|
  puts r
end

