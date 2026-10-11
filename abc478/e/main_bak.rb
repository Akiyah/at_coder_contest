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




def calc_group(group, paths)
  mins = {}
  maxs = {}
  selected = {}
  start_u = group[0]
  mins[start_u] = 0
  maxs[start_u] = 0 # 固定しておく
  selected[start_u] = true

  dp = [start_u]
  while 0 < dp.length
    u = dp.shift
    pp(u:) if $debug

    pp(mins:, maxs:) if $debug

    paths_u = paths[u]

    (paths_u[:le] || []).each do |v|
      if mins[u]
        min_a_v = mins[u] + 0
        mins[v] = min_a_v if !mins[v] || mins[v] < min_a_v
        if maxs[v] && maxs[v] < mins[v]
          pp(message: 'No(:le)', mins:, maxs:) if $debug
          return false
        end
      end

      unless selected[v]
        dp << v 
        selected[v] = true
      end
    end

    (paths_u[:lt] || []).each do |v|
      if mins[u]
        min_a_v = mins[u] + 1
        mins[v] = min_a_v if !mins[v] || mins[v] < min_a_v
        if maxs[v] && maxs[v] < mins[v]
          pp(message: 'No(:lt)', mins:, maxs:) if $debug
          return false
        end
      end
        
      unless selected[v]
        dp << v 
        selected[v] = true
      end
    end

    (paths_u[:ge] || []).each do |v|
      if maxs[u]
        max_a_v = maxs[u] - 0
        maxs[v] = max_a_v if !maxs[v] || max_a_v < maxs[v]
        if mins[v] && maxs[v] < mins[v]
          pp(message: 'No(:ge)', mins:, maxs:) if $debug
          return false
        end
      end
        
      unless selected[v]
        dp << v 
        selected[v] = true
      end
    end

    (paths_u[:gt] || []).each do |v|
      if maxs[u]
        max_a_v = maxs[u] - 1
        maxs[v] = max_a_v if !maxs[v] || max_a_v < maxs[v]
        if mins[v] && maxs[v] < mins[v]
          pp(message: 'No(:gt)', mins:, maxs:) if $debug
          return false
        end
      end
        
      unless selected[v]
        dp << v 
        selected[v] = true
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


  # <  lt less than
  # <= le less than or equal to
  # >  gt greater than
  # <= ge greater than or equal to
  paths = Hash.new() { |h, k| h[k] = {} }
  TUVS.each do |t, u1, v1|
    u = u1 - 1
    v = v1 - 1
    if t == 0
      paths[u][:le] ||= Set.new
      paths[u][:le] << v
      paths[v][:le] ||= Set.new
      paths[v][:le] << u
    else
      paths[u][:lt] ||= Set.new
      paths[u][:lt] << v
      paths[v][:gt] ||= Set.new
      paths[v][:gt] << u
    end
  end
  pp(paths:)if $debug

  dsu = AcLibraryRb::DSU.new(N)

  TUVS.each do |t, u1, v1|
    u = u1 - 1
    v = v1 - 1
    dsu.merge(u, v)
  end

  pp(dsu:) if $debug

  rss = []
  dsu.groups.each do |group|
    rs = calc_group(group, paths)
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



if $debug


end


