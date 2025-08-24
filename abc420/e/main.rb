#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)

def calc_1(u, v, nodes, paths, dsu, groups, blacks) # u < v
  paths[u] << v
  lu = dsu.leader(u)
  lv = dsu.leader(v)

  unless lu == lv
    l = dsu.merge(lu, lv)
    groups[l] = groups[lu] + groups[lv]
    blacks[l] = blacks[lu] + blacks[lv]
  end
end

def calc_2(v, nodes, paths, dsu, groups, blacks)
  l = dsu.leader(v)
  if nodes[v] # 元々がwhite
    blacks[l] += 1
  else # 元々がblack
    blacks[l] -= 1
  end
  nodes[v] = !nodes[v]
end

def calc_3(v, nodes, paths, dsu, groups, blacks)
  l = dsu.leader(v)
  if 0 < blacks[l]
    puts 'Yes'
  else
    puts 'No'
  end
end




def calc
  nodes = Array.new(N, true)
  paths = Array.new(N) { [] }
  dsu = AcLibraryRb::DSU.new(N)
  groups = N.times.map { |i| [i] }
  blacks = N.times.map { |i| 0 }
  pp(nodes:, dsu_groups: dsu.groups, groups:, blacks:) if $debug
  Q.times do
    query = STDIN.gets.chomp.split.map(&:to_i)
    pp(query:) if $debug
    if query[0] == 1
      calc_1(query[1] - 1, query[2] - 1, nodes, paths, dsu, groups, blacks)
    elsif query[0] == 2
      calc_2(query[1] - 1, nodes, paths, dsu, groups, blacks)
    else
      calc_3(query[1] - 1, nodes, paths, dsu, groups, blacks)
    end
    pp(nodes:, dsu_groups: dsu.groups, groups:, blacks:) if $debug
  end
end


calc()


