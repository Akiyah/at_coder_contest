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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
TUVS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  paths = {}
  TUVS.each do |t, u, v|
    paths[u] ||= []
    paths[u] << [v, t]
  end
  pp(paths:) if $debug

  paths[0] ||= []
  (1..N).each do |u|
    paths[0] << [u, 0]
  end
  pp(paths:) if $debug

  stack = []
  values = {}
  ds = {}
  indexies = {}
  used_nodes = {}

  stack << 0 # start
  values[0] = 0
  ds[0] = 0
  indexies[0] = 0
  used_nodes[0] = true

  while true
    u = stack[-1]
    i = indexies[u]
    pp(u:, i:, stack:, values:, ds:, indexies:, used_nodes: used_nodes.filter_map { |k, v| k if v } ) if $debug

    if paths[u] && i < paths[u].length
      v, t = paths[u][i]
      pp(v:, t:) if $debug
      if values[v] # 同じルートに乗っているvの場合
        if used_nodes[v]
          if values[v] + ds[v] < values[u] + t
            return false # 一周して1つ以上増えている
          end
        end

        # vの隣に移動する
        if values[v] + ds[v] < values[u] + t
          ds[v] = values[u] + t - values[v]
        end
        indexies[u] = i + 1
      else
        # vに進む
        stack << v
        values[v] = values[u] + t
        ds[v] = 0
        indexies[v] = 0
        used_nodes[v] = true
      end
    else
      # 全部見たので戻る
      stack.pop # u
      used_nodes[u] = false

      break if stack.length == 0 # 全部終わった場合
      u_parent = stack[-1]
      indexies[u_parent] += 1
    end
  end

  pp(values:, ds:) if $debug


  # 番号をつけていく
  stack = []
  indexies = {}
  ans = {}

  stack << 0 # start
  indexies[0] = 0
  ans[0] = 0
  d = 0

  while true
    u = stack[-1]
    i = indexies[u]
    pp(u:, i:, stack:, indexies:, ans:) if $debug

    if paths[u] && i < paths[u].length
      v, t = paths[u][i]
      pp(v:, t:) if $debug
      if ans[v] # 計算済み
        indexies[u] = i + 1
      else
        # vに進む
        stack << v
        indexies[v] = 0
        d += ds[v]
        ans[v] = values[v] + d
      end
    else
      # 全部見たので戻る
      stack.pop # u
      d -= ds[u]

      break if stack.length == 0 # 全部終わった場合
      u_parent = stack[-1]
      indexies[u_parent] += 1
    end
  end

  pp(ans:) if $debug


  (1..N).map { |i| ans[i] }
end

rs = calc()
if rs
  puts 'Yes'
  puts rs.join(' ')
else
  puts 'No'
end



if $debug && rs
  TUVS.each do |t, u, v|
    puts "#{t} #{u} #{v}"
    unless rs[u - 1] + t <= rs[v - 1]
      puts "NG"
    end
  end
end


# > 2 1 1 1 1 1 1 2 2 1 1 3 1 2 2
# > 1 0 0 0 0 0 0 1 1 0 0 2 0 1 1
