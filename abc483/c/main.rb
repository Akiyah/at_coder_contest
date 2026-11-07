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
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


map_a = Array.new(N, 0)
map_ab = {}
ABS.each do |a1, b1|
  a = a1 - 1
  b = b1 - 1
  map_a[a] += 1
  map_ab[a] ||= {}
  map_ab[a][b] ||= 0
  map_ab[a][b] += 1
end

pp(map_a:, map_ab:) if $debug

map_a_sorted = map_a.map.with_index { |c, a| [c, a] }.sort_by { |c, a| [-c, a] }
pp(map_a_sorted:) if $debug

c0, a0 = map_a_sorted[0]
c1, a1 = map_a_sorted[1]
pp(a0:, c0:) if $debug
pp(a1:, c1:) if $debug

N.times do |a|
  if a == a0
    a_max = a1
    c_max = c1
  else
    a_max = a0
    c_max = c0
  end

  bs = map_ab[a]
  if bs
    bs.each do |b, c|
      c_b = map_a[b]
      if (c_max < c_b + c) || (c_max == c_b + c && b < a_max)
        a_max = b
        c_max = c_b + c
      end
    end
  end
  puts a_max + 1
end





