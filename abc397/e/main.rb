#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'set'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1...(N * K)).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

if K == 1
  puts 'Yes'
  exit
end

pp({N:, K:, UVS:}) if $debug


paths = {}
UVS.each do |u, v|
  paths[u] ||= []
  paths[u] << v
  paths[v] ||= []
  paths[v] << u
end

pp({paths:}) if $debug

# edges = AcLibraryRb::PriorityQueue.new {|(u, du, lu), (v, dv, lv)| dv < du } # 深いものを先に取る
edges = {}

cps = [{ current: 1, parent: nil }]
parents = { 1 => nil}
d = 0
d_max = 0

while 0 < cps.length
  next_cps = []
  cps.each do |cp|
    u = cp[:current]
    parent = cp[:parent]
    children = paths[u] - [parent]
    children.each { |child| parents[child] = u }
    if children.length == 0
      # edges.push([u, d, 1])
      d_max = d if d_max < d
      edges[d] ||= {}
      edges[d][u] = []
    else
      next_cps += children.map{|child| { current: child, parent: u } }
    end
  end
  d += 1
  cps = next_cps
end

pp({edges:, d_max:, parents:}) if $debug


def calc(edges, d_max, parents)
  count = 0
  (d_max..0).step(-1).each do |d|
    pp({d:}) if $debug
    edges[d - 1] ||= {}
    edges[d].each do |u, ls|
      pp({u:, ls:}) if $debug

      parent = parents[u]

      if ls.length == 0 # start
        edges[d - 1][parent] ||= []
        edges[d - 1][parent] << 2 # 線を伸ばす
      elsif ls.length == 1
        if ls[0] == K
          count += 1
          edges[d - 1][parent] ||= [] # 次のスタート
        else
          edges[d - 1][parent] ||= []
          edges[d - 1][parent] << ls[0] + 1 # 線を伸ばす
        end
      elsif ls.length == 2
        if ls[0] + ls[1] == K + 1 # ２つの線がつながった
          count += 1
          edges[d - 1][parent] ||= [] # 次のスタート
        else
          return false
        end
      else
        return false
      end
    end
  end

  count == N && edges[-1][nil].length == 0
end


if calc(edges, d_max, parents)
  puts 'Yes'
else
  puts 'No'
end
