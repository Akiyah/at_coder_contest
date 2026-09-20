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


N, M, K = STDIN.gets.chomp.split.map(&:to_i)
T = STDIN.gets.chomp
SS = (1..N).map do
  STDIN.gets.chomp
end

Q = STDIN.gets.chomp.to_i

ijs = Q.times.map do
  i, j = STDIN.gets.chomp.split.map(&:to_i)
  [i - 1, j - 1]
end

z_t = T.tr('ox', '01').to_i(2)
zs = SS.map { |s| s.tr('ox', '01').to_i(2) ^ z_t }

def calc(zs, ijs)
  pp(zs:, ijs:) if $debug
  
  pp(zs: zs.map { |z| z.to_s(2) }) if $debug


  h = {}
  zs.each do |z|
    h[z] ||= 0
    h[z] += 1
  end
  pp(h:) if $debug

  zs2 = zs.dup
  ijs.each do |i, j|
    zs2[i] ^= (1 << (K - 1 - j))
    h[zs2[i]] ||= 0
  end
  pp(h:) if $debug

  z2i = h.keys.sort.map.with_index { |z, i| [z, i] }.to_h
  vs = []
  h.each do |z, v|
    vs[z2i[z]] = v
  end

  pp(z2i:, vs:) if $debug

  seg = AcLibraryRb::SegTree.new(vs, 0) { |v1, v2| v1 + v2 }
  pp(seg: vs.map { |v| [v.to_s(2), seg.get(z2i[v])] }) if $debug

  zs2 = zs.dup
  rs = []
  ijs.each do |i, j|
    pp(i:, j:) if $debug
    pp(zs2:, h:) if $debug
    z = zs2[i]
    h[z] -= 1
    pp(zs2:, h:) if $debug
    seg.set(z2i[z], h[z])
    z ^= (1 << (K - 1 - j))
    zs2[i] = z
    h[z] += 1
    pp(zs2:, h:) if $debug
    seg.set(z2i[z], h[z])

    pp('z2i[z]' => z2i[z]) if $debug

    sum = seg.prod(0, z2i[z] + 1)
    pp(seg: vs.map { |v| [v.to_s(2), seg.get(z2i[v])] }) if $debug
    # pp(seg:) if $debug
    pp(z:, sum:) if $debug
    rs << ((z != ((1 << K) - 1)) && (sum <= M))
  end

  rs
end

rs = calc(zs, ijs)
rs.each do |r|
  puts r ? 'Yes' : 'No'
end
