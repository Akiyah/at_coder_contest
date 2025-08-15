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


# ds = {}
# ds = Hash.new { Hash.new { Hash.new { 0 } } }

ds = Hash.new do |hash1, key1|
  hash1[key1] = Hash.new do |hash2, key2|
    hash2[key2] = Hash.new do |hash3, key3|
      hash3[key3] = 0
    end
  end
end
XYS.sort.combination(2) do |(x1, y1), (x2, y2)|
  # pp(x1:, y1:, x2:, y2:) if $debug
  dx = (x1 - x2)
  dy = (y1 - y2)
  # if dx < 0
  #   dx *= -1
  #   dy *= -1
  # end
  # if dx == 0 && dy < 0
  #   dy *= -1
  # end
  g = dx.gcd(dy)
  dx /= g
  dy /= g
  # ds[dx] ||= {}
  # ds[dx][dy] ||= {}
  # ds[dx][dy][g] ||= 0
  ds[dx][dy][g] += 1
end
pp(ds: ds.sort) if $debug

r = 0
r_minus = 0
ds.each do |dx, dys|
  dys.each do |dy, gs|
    c_sum = 0
    gs.each do |g, c|
      c_sum += c
      r_minus += c * (c - 1) / 2
    end
    r += c_sum * (c_sum - 1) / 2
  end
end

pp(r:, r_minus:) if $debug
puts r - r_minus / 2

