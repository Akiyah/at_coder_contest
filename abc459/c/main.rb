#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# Q = STDIN.gets.chomp.to_i
N, Q = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


$heights = Array.new(N, 0)

$segtree = AcLibraryRb::Segtree.new(3 * 10 ** 5, 0) { |x, y| x + y }
$segtree.set(0, N)

$level = 0

def calc_1(x)
  h = $heights[x - 1]
  $heights[x - 1] += 1

  c = $segtree.get(h)
  $segtree.set(h, c - 1)
  c1 = $segtree.get(h + 1)
  $segtree.set(h + 1, c1 + 1)

  if h == $level && c - 1 == 0
    $level += 1
  end
end

def calc_2(y)
  pp(s0: $segtree.get(0)) if $debug
  pp(s1: $segtree.get(1)) if $debug
  pp(s2: $segtree.get(2)) if $debug
  pp(s3: $segtree.get(3)) if $debug
  pp(s4: $segtree.get(4)) if $debug
  pp(s5: $segtree.get(5)) if $debug
  pp(s6: $segtree.get(6)) if $debug
  $segtree.prod(y + $level, 3 * 10 ** 5)
end


Q.times do |q|
  t, xy = STDIN.gets.chomp.split.map(&:to_i)
  pp(t:, xy:) if $debug
  if t == 1
    calc_1(xy)
  else
    puts calc_2(xy)
  end
  pp(level: $level) if $debug
  # pp($heights) if $debug
  # pp($segtree.get(0)) if $debug
  # pp($segtree.get(1)) if $debug
  # pp($segtree.get(2)) if $debug
  # pp($segtree.get(3)) if $debug
  # pp($segtree.get(4)) if $debug
  # pp($segtree.get(5)) if $debug
  # pp($segtree.get(6)) if $debug
  # pp($segtree.get(7)) if $debug
  # pp($segtree.get(8)) if $debug
end

