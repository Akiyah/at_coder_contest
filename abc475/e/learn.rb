#!/usr/bin/env ruby

require 'rblineprof'
require 'rblineprof-report'

require "ac-library-rb/segtree"

target = /#{Dir.pwd}\/./

profile = lineprof(target) do
  n = 5 * 10 ** 5
  vs = n.times.to_a.shuffle

  # seg = AcLibraryRb::SegTree.new(vs, 0) { |v1, v2| [v1, v2].max }
  seg = AcLibraryRb::SegTree.new(vs, -1) { |v1, v2| v1 < v2 ? v2 : v1 }

  10000.times do |t|
    i = rand(n)
    j = rand(n)
    i, j = j, i unless i < j

    v1 = seg.get(i)
    v2 = seg.get(j)

    seg.set(i, v2)
    seg.set(j, v1)

    ans = seg.prod(i, j + 1)
    # pp(t:, i:, j:, ans:)
  end



  n = 5 * 10 ** 5
  vs = n.times.to_a.shuffle
  vs = vs.map.with_index { |v, i| [v, i] }

  seg = AcLibraryRb::SegTree.new(vs, [-1, -1]) { |(v1, i1), (v2, i2)| v1 < v2 ? [v2, i2] : [v1, i1] }

  10000.times do |t|
    i = rand(n)
    j = rand(n)
    i, j = j, i unless i < j

    v1, i1 = seg.get(i)
    v2, i2 = seg.get(j)

    seg.set(i, [v2, i2])
    seg.set(j, [v1, i1])

    ans_v, ans_i = seg.prod(i, j + 1)
    # pp(t:, i:, j:, ans:)
  end
end

LineProf.report(profile)




profile = lineprof(target) do
  n = 5 * 10 ** 5
  vs = n.times.to_a.shuffle

  10000.times do |t|
    i = rand(n)
    j = rand(n)
    i, j = j, i unless i < j

    v1 = vs[i]
    v2 = vs[j]

    vs[i] = v2
    vs[j] = v1
  end




  n = 5 * 10 ** 5
  vs = n.times.to_a.shuffle
  vs = vs.map.with_index { |v, i| [v, i] }

  10000.times do |t|
    i = rand(n)
    j = rand(n)
    i, j = j, i unless i < j

    v1, i1 = vs[i]
    v2, i2 = vs[j]

    vs[i] = [v2, i2]
    vs[j] = [v1, i1]
  end
end

LineProf.report(profile)




