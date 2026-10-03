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
TUVS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end




def calc_group(group, path0, path0_r, path1, path1_r)
  mins = {}
  maxs = {}
  calced = {}
  s = group[0]
  mins[s] = 0
  maxs[s] = 0 # 固定しておく
  # calced[s] = true

  dp = [[s, 0], [s, 1]]
  while 0 < dp.length
    u, dir = dp.shift
    pp(u:, dir:) if $debug
    calced[u] ||= {}
    next if calced[u][dir]
    calced[u][dir] = true
    pp(mins:, maxs:) if $debug

    pp('path0[u]' => path0[u],'path0_r[u]' => path0_r[u],'path1[u]' => path1[u],'path1_r[u]' => path1_r[u]) if $debug
    if dir == 0
      (path0[u] || []).each do |v|
        if mins[u]
          min_a_v = mins[u] + 0
          mins[v] = min_a_v if !mins[v] || mins[v] < min_a_v
          if maxs[v] && maxs[v] < mins[v]
            return false
          end
        end
        
        dp << [v, 0] if !calced[v] || !calced[v][0]
        dp << [v, 1] if !calced[v] || !calced[v][1]
      end
      (path1[u] || []).each do |v|
        if mins[u]
          min_a_v = mins[u] + 1
          mins[v] = min_a_v if !mins[v] || mins[v] < min_a_v
          if maxs[v] && maxs[v] < mins[v]
            return false
          end
        end
        dp << [v, 0] if !calced[v] || !calced[v][0]
        dp << [v, 1] if !calced[v] || !calced[v][1]
      end
    else
      (path0_r[u] || []).each do |v|
        if maxs[u]
          max_a_v = maxs[u] + 0
          maxs[v] = max_a_v if !maxs[v] || max_a_v < maxs[v]
          if mins[v] && maxs[v] < mins[v]
            return false
          end
        end
        dp << [v, 0] if !calced[v] || !calced[v][0]
        dp << [v, 1] if !calced[v] || !calced[v][1]
      end
      (path1_r[u] || []).each do |v|
        if maxs[u]
          max_a_v = maxs[u] - 1
          maxs[v] = max_a_v if !maxs[v] || max_a_v < maxs[v]
          if mins[v] && maxs[v] < mins[v]
            return false
          end
        end
        dp << [v, 0] if !calced[v] || !calced[v][0]
        dp << [v, 1] if !calced[v] || !calced[v][1]
      end
    end
  end


  pp(mins:, maxs:) if $debug
  ans = {}
  group.each do |u|
    if mins[u]
      ans[u] = mins[u]
    else
      ans[u] = maxs[u]
    end
  end

  ans
end


def calc
  path0 = {}
  path1 = {}
  path0_r = {}
  path1_r = {}
  TUVS.each do |t, u1, v1|
    u = u1 - 1
    v = v1 - 1
    if t == 0
      path0[u] ||= []
      path0[u] << v
      path0_r[v] ||= []
      path0_r[v] << u
    else
      path1[u] ||= []
      path1[u] << v
      path1_r[v] ||= []
      path1_r[v] << u
    end
  end
  pp(path0:, path0_r:, path1:, path1_r:)if $debug

  dsu = AcLibraryRb::DSU.new(N)

  TUVS.each do |t, u1, v1|
    u = u1 - 1
    v = v1 - 1
    dsu.merge(u, v)
  end

  pp(dsu:) if $debug

  rss = []
  dsu.groups.each do |group|
    rs = calc_group(group, path0, path0_r, path1, path1_r)
    pp(group:, rs:) if $debug
    return false unless rs
    rss << rs
  end
  pp(rss:) if $debug

  ans = []
  rss.each do |rs|
    rs.each do |u, i|
      ans[u] = i
    end
  end
  pp(ans:) if $debug
  ans
end

rs = calc()
if rs
  puts 'Yes'
  puts rs.join(' ')
else
  puts 'No'
end
