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


ds = {}
ds_minus = {}
XYS.sort.combination(2) do |(x1, y1), (x2, y2)|
  # pp(x1:, y1:, x2:, y2:) if $debug
  dx = x2 - x1
  dy = y2 - y1
  g = dx.gcd(dy)
  dx /= g
  dy /= g
  ds[dx] ||= Hash.new(0)
  ds[dx][dy] += 1

  ds_minus[x2 + x1] ||= Hash.new(0)
  ds_minus[x2 + x1][y2 + y1] += 1
end
pp(ds: ds.sort) if $debug

r = 0
r_minus = 0
ds.each do |dx, dys|
  dys.each do |dy, c|
    r += c * (c - 1) / 2
  end
end
ds_minus.each do |dx, dys|
  dys.each do |dy, c|
    r_minus += c * (c - 1) / 2
  end
end

pp(r:, r_minus:) if $debug
puts r - r_minus

