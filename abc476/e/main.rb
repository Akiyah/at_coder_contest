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

N, M = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc(ps, lrs)
  p2i = [] 
  ps.each.with_index { |p, i| p2i[p] = i }
  pp(ps:) if $debug
  pp(p2i:) if $debug

  seg_max = AcLibraryRb::Segtree.new(ps, -1) { |p0, p1| [p0, p1].max }
  seg_min = AcLibraryRb::Segtree.new(ps, 2 * 10 ** 5 + 1) { |p0, p1| [p0, p1].min }

  lrs.each do |l, r|
    pp(l:, r:) if $debug

    pmax = seg_max.prod(l, r + 1)
    pmin = seg_min.prod(l, r + 1)
    pp(pmax:, pmin:) if $debug

    imax = p2i[pmax]
    imin = p2i[pmin]
    pp(imax:, imin:) if $debug
    
    seg_max.set(imax, pmin)
    seg_max.set(imin, pmax)
    seg_min.set(imax, pmin)
    seg_min.set(imin, pmax)

    ps[imax] = pmin
    ps[imin] = pmax

    p2i[pmax] = imin
    p2i[pmin] = imax

    pp(ps:) if $debug
    pp(p2i:) if $debug
  end

  ps
end


ps = PS.map { |p| p - 1 }
lrs = LRS.map { |l, r| [l - 1, r - 1] }

ps = calc(ps, lrs)

puts ps.map { |p| p + 1 }.join(' ')