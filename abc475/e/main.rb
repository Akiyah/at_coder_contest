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

ts = T.chars
zs = SS.map { |s| s.chars.map.with_index { |c, j| c == ts[j] ? 0 : (1 << (K - 1 - j)) }.sum }

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

  k2i = h.keys.sort.map.with_index { |k, i| [k, i] }.to_h
  vs = []
  h.each do |k, v|
    vs[k2i[k]] = v
  end

  pp(k2i:, vs:) if $debug

  segtree = AcLibraryRb::SegTree.new(vs, 0) { |v1, v2| v1 + v2 }
  pp(segtree: vs.map { |v| [v.to_s(2), segtree.get(k2i[v])] }) if $debug

  zs2 = zs.dup
  rs = []
  ijs.each do |i, j|
    pp(i:, j:) if $debug
    pp(zs2:, h:) if $debug
    z = zs2[i]
    h[z] -= 1
    pp(zs2:, h:) if $debug
    segtree.set(k2i[z], h[z])
    z ^= (1 << (K - 1 - j))
    zs2[i] = z
    h[z] += 1
    pp(zs2:, h:) if $debug
    segtree.set(k2i[z], h[z])

    pp('k2i[z]' => k2i[z]) if $debug

    sum = segtree.prod(0, k2i[z] + 1)
    pp(segtree: vs.map { |v| [v.to_s(2), segtree.get(k2i[v])] }) if $debug
    # pp(segtree:) if $debug
    pp(z:, sum:) if $debug
    rs << ((z != ((1 << K) - 1)) && (sum <= M))
  end

  rs
end

rs = calc(zs, ijs)
rs.each do |r|
  puts r ? 'Yes' : 'No'
end
