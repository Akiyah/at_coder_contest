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

dis = Array.new(2000) { [] }
uis = Array.new(2000) { [] }
UDLRS.each.with_index do |(u, d, l, r), i|
  dis[d - 1] << i
  uis[u - 1] << i
end

lis = Array.new(2000) { Set.new }
ris = Array.new(2000) { Set.new }
count0 = 0
count1 = Array.new(N, 0)
count2 = 0
2000.times do |x|
  pp(x:) if $debug
  dis[x].each do |i|
    u, d, l, r = UDLRS[i]
    lis[l - 1] << i
    ris[r - 1] << i
  end

  is = Set.new
  2000.times do |y|
    is += lis[y]
    d = is.length

    if d == 0
      count0 += 1
    elsif d == 1
      i = is.to_a[0]
      count1[i] += 1
    else
      count2 += 1
    end

    is -= ris[y]
  end

  uis[x].each do |i|
    u, d, l, r = UDLRS[i]
    lis[l - 1].delete(i)
    ris[r - 1].delete(i)
  end
end

N.times do |i|
  puts (count0 + count1[i])
end


