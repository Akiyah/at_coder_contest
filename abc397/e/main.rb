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
edges = []

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
      edges[d][u] = 1
    else
      next_cps += children.map{|child| { current: child, parent: u } }
    end
  end
  d += 1
  cps = next_cps
end

pp({edges:, d_max:, parents:}) if $debug


def calc(edges, d_max, parents)
  (d_max..0).step(-1).each do |d|
    pp({d:}) if $debug
    edges[d].each do |u, l|
      pp({u:, l:}) if $debug

      if d == 0
        if l == K
          return true
        else
          return false
        end
      end

      parent = parents[u]
      # return true unless parent

      edges[d - 1] ||= {}

      if edges[d - 1][parent] == nil || edges[d - 1][parent] == 1
        if l == K
          edges[d - 1][parent] = 1
        else
          edges[d - 1][parent] = l + 1
        end
      elsif edges[d - 1][parent] == -1
        if l == K
        else
          return false
        end
      else
        if l == K
          # なにもしない
        else
          return false unless edges[d - 1][parent] + l == K

          edges[d - 1][parent] = -1 # 使用不可

          if 0 <= d - 2
            edges[d - 2] ||= {}
            edges[d - 2][parents[parent]] = 1
          end
        end
      end
    end
  end

  true
end


if calc(edges, d_max, parents)
  puts 'Yes'
else
  puts 'No'
end
