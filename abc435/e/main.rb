#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"
require "ac-library-rb/lazy_segtree"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


lis = LRS.map.with_index { |(l, r), i| [l, i, true] }
ris = LRS.map.with_index { |(l, r), i| [r + 1, i, false] }
lris = (lis + ris).sort_by { |lr, i, t| lr } # 2 * Q 個

i2j_l = [] # Q 個
i2j_r = [] # Q 個
lris.each.with_index do |(lr, i, t), j| # 0 <= j < 2 * Q
  if t
    i2j_l[i] = j
  else
    i2j_r[i] = j
  end
end

ds = [] # 1 + (2 * Q - 1) + 1 = 2 * Q + 1 個
ds << lris[0][0] - 1
lris.each_cons(2).with_index do |((lr0, i0, t0), (lr1, i1, t1)), j|
  d = lr1 - lr0
  ds << d
end
ds << (N + 1) - lris[-1][0]

# create lazy segtree
e = 0
id = 0
op = proc { |x, y| x + y }
mapping = proc { |f, x| [f + x, 0].max }
composition = proc { |f, g| f + g }

seg = AcLibraryRb::LazySegtree.new(ds, e, id, op, mapping, composition)


# 10.times { |i| pp seg.get(i) }
# seg.apply(2,4,-10)

# 10.times { |i| pp seg.prod(i, i + 1) }


if $debug
  pp (2 * Q + 1).times.map { |q| seg.get(q) }
end

Q.times do |i|
  j_l = i2j_l[i] + 1
  j_r = i2j_r[i] + 1
  # l, _ = lris[j_l]
  # r, _ = lris[j_r]

  seg.apply(j_l, j_r, -N)
  # puts seg.prod(0, 2 * Q + 1)
  puts seg.all_prod
  if $debug
    pp (2 * Q + 1).times.map { |q| seg.get(q) }
  end
end


