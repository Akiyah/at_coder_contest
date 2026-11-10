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

N, M = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..N).map do
  STDIN.gets.chomp
end


pp(SS:) if $debug

zs = SS.map { |s| s.codepoints.map.with_index { |c, i| (c - 'a'.ord) << ((M - 1 - i) * 5)  }.sum }
pp(zs:) if $debug

r0 = zs.tally.values.map { |c| c * (c - 1) / 2 }.sum
pp(r0:) if $debug

z1s = []
M.times do |i|
  zs.each do |z|
    z1 = z | (0b11111 << (i * 5))
    z1s << z1
  end
end
pp(z1s:) if $debug
r1 = z1s.tally.values.map { |c| c * (c - 1) / 2 }.sum
pp(r1:) if $debug

z2s = []
(0...M).to_a.combination(2).each do |i, j|
  zs.each do |z|
    z2 = z | (0b11111 << (i * 5)) | (0b11111 << (j * 5))
    z2s << z2
  end
end
pp(z2s:) if $debug
r2 = z2s.tally.values.map { |c| c * (c - 1) / 2 }.sum
pp(r2:) if $debug

r0_ = r0
r1_ = r1 - r0_ * M
r2_ = r2 - r1_ * (M - 1) - r0_ * M * (M - 1) / 2
pp(r0_:, r1_:, r2_:) if $debug

r = r0_ + r1_ + r2_
puts r
