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

N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


ds = Hash.new do |hash1, key1|
  hash1[key1] = Hash.new do |hash2, key2|
    hash2[key2] = 0
  end
end
ds_sum = Hash.new { 0 }
# ds = Hash.new { Hash.new { Hash.new { 0 } } }

# ds = Hash.new do |hash1, key1|
#   hash1[key1] = Hash.new do |hash2, key2|
#     hash2[key2] = 0
#   end
# end

xys = XYS.sort

r = 0
r_minus = 0
(0...N).each do |i|
  x1, y1 = xys[i]
  ((i + 1)...N).each do |j|
    x2, y2 = xys[j]
    # pp(x1:, y1:, x2:, y2:) if $debug
    dx = x2 - x1
    dy = y2 - y1
    if dy == 0
      t = Float::INFINITY
    else
      t = Rational(dx, dy)
    end
    g = dx.gcd(dy)

    # ds[t] ||= Hash.new() { 0 }
    if ds[t][g]
      r_minus += ds[t][g]
      ds[t][g] += 1
    else
      ds[t][g] = 1
    end

    if ds_sum[t]
      r += ds_sum[t]
      ds_sum[t] += 1
    else
      ds_sum[t] = 1
    end
    # ds_sum[t] ||= 0
    # ds_sum[t] += 1

    # r += ds_sum[t] - 1
  end
end
pp(ds: ds.sort) if $debug

# r = 0
# r_minus = 0
# ds.each do |t, gs|
#   c_sum = 0
#   gs.each do |g, c|
#     c_sum += c
#     r_minus += c * (c - 1) / 2
#   end
#   r += c_sum * (c_sum - 1) / 2
# end

pp(r:, r_minus:) if $debug
puts r - r_minus / 2

