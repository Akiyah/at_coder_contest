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
AS = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

paths = {}
UVS.each do |u, v|
  paths[u - 1] ||= []
  paths[u - 1] << v - 1
  paths[v - 1] ||= []
  paths[v - 1] << u - 1
end


def create_tree(paths)
  top = [0, nil, paths[0]] # node, parent, children
  tree = []
  tree[0] = top

  dp = [top]
  while 0 < dp.length
    node, parent, children = dp.shift
    if children
      children.each do |child|
        if child != parent
          tree[child] = [child, node, paths[child] - [node]]
          dp << tree[child]
        end
      end
    end
  end

  tree
end


def calc(paths, tree)

  rs = []
  acs = Hash.new(0)
  rs[0] = false
  acs[AS[0]] = 1

  current_node = 0
  current_b_count = 0
  while current_node
    node, parent, children = tree[current_node]
    pp(current_node:, node:, parent:, children:, rs:) if $debug

    if children.length == 0
      acs[AS[current_node]] -= 1 # 数字を戻す
      if acs[AS[current_node]] == 1
        current_b_count -= 1
      end
      current_node = parent # 上に戻る
    else
      current_node = children.pop # 次の子供をチェックする（ひとつ下に行く）
      acs[AS[current_node]] += 1
      if acs[AS[current_node]] == 2
        current_b_count += 1
      end
      rs[current_node] = (0 < current_b_count)
      pp(current_node:, rs_c: rs[current_node], rs:, acs:) if $debug
    end

    # pp(acs:, rs:) if $debug
  end

  rs
end

tree = create_tree(paths)
pp(tree:) if $debug

rs = calc(paths, tree)
rs.each do |r|
  puts r ? 'Yes' : 'No'
end







