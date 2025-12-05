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
UDLRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

ulis = Array.new(2000) { Array.new(2000) }
uris = Array.new(2000) { Array.new(2000) }
dlis = Array.new(2000) { Array.new(2000) }
dris = Array.new(2000) { Array.new(2000) }
UDLRS.each.with_index do |(u, d, l, r), i|
  pp(i:) if $debug

  ulis[u - 1][l - 1] ||= []
  uris[u - 1][r - 1] ||= []
  dlis[d - 1][l - 1] ||= []
  dris[d - 1][r - 1] ||= []

  ulis[u - 1][l - 1] << i
  uris[u - 1][r - 1] << i
  dlis[d - 1][l - 1] << i
  dris[d - 1][r - 1] << i
end

count0 = 0
count1 = Array.new(N, 0)
count2 = 0
iss = Array.new(2000) { [] }
2000.times do |x|
  pp(x:) if $debug
  dis = []
  2000.times do |y|
    dis += ulis[x][y] if ulis[x][y]
    iss[y] += dis
    dis -= uris[x][y] if uris[x][y]
  end

  2000.times do |y|
    d = iss[y].length

    if d == 0
      count0 += 1
    elsif d == 1
      i = iss[y].to_a[0]
      count1[i] += 1
    else
      count2 += 1
    end
  end

  dis = []
  2000.times do |y|
    dis += dlis[x][y] if dlis[x][y]
    iss[y] -= dis
    dis -= dris[x][y] if dris[x][y]
  end
end

pp(count0:, count1:, count2:) if $debug
N.times do |i|
  puts (count0 + count1[i])
end


