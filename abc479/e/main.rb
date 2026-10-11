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
ABS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = []
ABS.each do |a1, b1|
  a, b = a1 - 1, b1 - 1
  paths[a] ||= []
  paths[a] << b
  paths[b] ||= []
  paths[b] << a
end


node_datas = [{ parent: nil, current: 0, depth: 0, weight: 0, diff: 0, value: 0 }]
as_by_depth = []
as_by_depth << [0]

dp = [0]
depth = 0
while 0 < dp.length
  pp(dp:) if $debug
  pp(node_datas:) if $debug
  new_dp = []

  dp.each do |a|
    node = node_datas[a]
    parent = node[:parent]
    current = node[:current]
    depth = node[:depth]
    childs = []
    (paths[current] || []).each do |child|
      next if child == parent
      childs << child
      child_node = { parent: current, current: child, depth: depth + 1, weight: 0, diff: 0, value: 0 }
      node_datas[child] = child_node
      new_dp << child
      as_by_depth[depth + 1] ||= []
      as_by_depth[depth + 1] << child
    end
    pp(current:, parent:, childs:) if $debug

    node[:childs] = childs
  end

  dp = new_dp
end

pp(node_datas:) if $debug
pp(as_by_depth:) if $debug

max_depth = as_by_depth.length - 1
as_by_depth.reverse.each.with_index do |as, i|
  as.each do |a|
    depth = max_depth - i
    node_data = node_datas[a]
    node_data[:weight] += 1
    parent = node_data[:parent]
    node_datas[parent][:weight] += node_data[:weight] if parent
  end
end


pp(node_datas:) if $debug





base_diff = 0
ABS.each.with_index(1) do |(a1, b1), i|
  a, b = a1 - 1, b1 - 1

  node_data_a = node_datas[a]
  node_data_b = node_datas[b]
  
  if node_data_a[:depth] < node_data_b[:depth]
    weight_b = node_data_b[:weight]
    weight_a = N - weight_b
    if weight_a < weight_b # 下の方が多い
      node_data_b[:diff] += i
    else
      base_diff += i
      node_data_b[:diff] -= i
    end
  else
    weight_a = node_data_a[:weight]
    weight_b = N - weight_a
    if weight_b < weight_a # 下の方が多い
      node_data_a[:diff] += i
    else
      base_diff += i
      node_data_a[:diff] -= i
    end
  end
end

pp(node_datas:) if $debug
pp(base_diff:) if $debug


dp = [0]
node_datas[0][:value] = base_diff
while 0 < dp.length
  new_dp = []

  dp.each do |a|
    node = node_datas[a]
    value = node[:value]
    node[:childs].each do |child|
      node_data_child = node_datas[child]
      node_data_child[:value] = node_data_child[:diff] + value
      new_dp << child
    end
  end

  dp = new_dp
end

pp(node_datas:) if $debug




puts node_datas.map { |node_data| node_data[:value] }.join(' ')
