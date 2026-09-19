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


def calc(ps)
  pis = ps.map.with_index { |p, i| [p, i, p, i] }
  pp(pis:) if $debug

  # seg_max = AcLibraryRb::Segtree.new(pis, [0, -1]) { |(p0, i0), (p1, i1)| p0 > p1 ? [p0, i0] : [p1, i1] }
  # seg_min = AcLibraryRb::Segtree.new(pis, [2 * 10 ** 5 + 1, -1]) { |(p0, i0), (p1, i1)| p0 < p1 ? [p0, i0] : [p1, i1] }
  seg = AcLibraryRb::Segtree.new(pis, [0, -1, 2 * 10 ** 5 + 1, -1]) { |(pmax0, imax0, pmin0, imin0), (pmax1, imax1, pmin1, imin1)|
    pmax, imax = (pmax0 > pmax1 ? [pmax0, imax0] : [pmax1, imax1])
    pmin, imin = (pmin0 < pmin1 ? [pmin0, imin0] : [pmin1, imin1])
    [pmax, imax, pmin, imin]
  }

  LRS.each do |l1, r1|
    l = l1 - 1
    r = r1 - 1
    pp(l1:, l:, r1:, r:) if $debug

    pmax, imax, pmin, imin = seg.prod(l, r + 1)
    pp(pmax:, imax:, pmin:, imin:) if $debug
    # pp(p_max:, i_max:) if $debug
    # pp(p_min:, i_min:) if $debug

    seg.set(imax, [pmin, imax, pmin, imax])
    seg.set(imin, [pmax, imin, pmax, imin])
    # seg_min.set(i_max, [p_min, i_max])
    # seg_min.set(i_min, [p_max, i_min])
    pp(seg: [seg.get(0), seg.get(1), seg.get(2), seg.get(3), seg.get(4)]) if $debug

    pis[imax] = [pmin, imax, pmin, imax]
    pis[imin] = [pmax, imin, pmax, imin]

    pp(pis:) if $debug
  end

  pis.map { |p, i| p }
end


ps = PS.dup
ps = calc(ps)

puts ps.join(' ')