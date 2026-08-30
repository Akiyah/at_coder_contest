#!/usr/bin/env ruby

require "ac-library-rb/lazy_segtree"

INF = 10 ** 10

# create lazy segtree, 最小を探すsegtree
e = INF
id = 0
op = proc { |x, y| [x, y].min }
mapping = proc { |f, x| f + x }
composition = proc { |f, g| f + g }

ds = [0,1,2,3,2,1,0,-1,-2,-3,-2,-1,0]

seg = AcLibraryRb::LazySegtree.new(ds, e, id, op, mapping, composition)

pp(seg:)

def seg_to_s(seg)
  n = seg.instance_variable_get(:@n)
  n.times.map { |i| seg.get(i) }
end


pp(seg: seg_to_s(seg))

pp(seg)

pp(seg: seg_to_s(seg))

seg.prod(0, 13)
seg.apply(0, 13, 1)
