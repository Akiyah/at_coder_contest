#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
AS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
pp(AS:) if $debug


pq = AcLibraryRb::PriorityQueue.new {|(i1, j1, d1), (i2, j2, d2)| d1 < d2 }
ds = Array.new(N) { Array.new(N) }
(0...N).each do |i|
  ((i + 1)...N).each do |j|
    d = AS[i][j - i - 1]
    ds[i][j] = d
    ds[j][i] = d
    pq << [i, j, d]
  end
end
(0...N).each do |i|
  ds[i][i] = 0
end

puts(ds.map { |line| line.join(', ') }.join("\n")) if $debug
pp(pq:) if $debug

def calc(ds, pq)
  dsu = AcLibraryRb::DSU.new(N)
  groups = N.times.map { |i| [i] }

  while ijd = pq.pop
    i, j, d = ijd
    pp(i:, j:, d:) if $debug

    if dsu.same?(i, j)
    else
      li = dsu.leader(i)
      lj = dsu.leader(j)
      gi = groups[li]
      gj = groups[lj]

      dij = ds[i][j]
      dis = ds[i]
      djs = ds[j]
      gi.each do |i1|
        disi1 = dis[i1]
        di1s = ds[i1]
        gj.each do |j1|
          pp(i1:, j1:) if $debug
          return false unless di1s[j1] == disi1 + dij + djs[j1]
        end
      end

      dsu.merge(li, lj)
      l = dsu.leader(li)
      groups[l] = groups[li] + groups[lj]
    end
  end

  true
end

puts calc(ds, pq) ? 'Yes' : 'No'
