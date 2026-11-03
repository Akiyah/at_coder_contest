#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
UVS = (N - 1).times.map do
  STDIN.gets.chomp.split.map(&:to_i)
end
CS = STDIN.gets.chomp.split.map(&:to_i)


def create_tree(start_node, startr_parent, paths)
  dp = []
  dp << [start_node, startr_parent, 0]
  ds = {}
  ds[0] = []
  ds[0] << start_node

  depth_max = 0

  while 0 < dp.length
    node, parent, depth = dp.shift
    paths[node].each do |v|
      next if v == parent
      dp << [v, node, depth + 1]
      ds[depth + 1] ||= []
      ds[depth + 1] << v
      depth_max = [depth_max, depth + 1]
    end
  end

  pp(ds:) if $debug
  pp(depth_max:) if $debug

  [ds[depth_max], depth_max]
end

def calc_1(paths)
  vs, depth_max = create_tree(start_node, paths)
  c = CS[1 - 1]

  vs.map { |v| CS[v - 1] }.tally[c].length
end

def calc_over_1(paths)
  xs = []
  paths[1].each do |v|
    vs, depth = create_tree(start_node, paths)
    xs << [vs, depth]
  end

  ys = xs.group_by { |vs, depth| depth }
  ks = ys.keys.sort.reverse

  if 1 < ys[ks[0]].length
    cs = ys[ks[0]].map { |vs, depth| vs.length }
    (cs.sum ** 2) - (cs.map { |c| c ** 2 })
  else
    # ys[ks[0]].length == 1
    cs = ys[ks[1]].map { |vs, depth| vs.length }
    
  end

end


def calc

  paths = {}
  UVS.each do |u, v|
    paths[u] ||= []
    paths[u] << v
    paths[v] ||= []
    paths[v] << u
  end
  pp(paths:) if $debug

  if paths[1].length == 1
    calc_1(paths)
  else
    calc_over_1(paths)
  end
end

puts calc
