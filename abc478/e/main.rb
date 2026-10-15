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
  paths = Array.new(N) { [] }
  paths_r = Array.new(N) { [] }
  TUVS.each do |t, u1, v1|
    u = u1 - 1
    v = v1 - 1
    paths[u] << [v, t]
    paths_r[v] << [u, t]
  end
  pp(paths:, paths_r:) if $debug

  used = []
  ordered_us = []
  u2is = []
  i = 0

  N.times.to_a.each do |u|
    stack = [u]
    while 0 < stack.length
      pp(stack:, used:, i:) if $debug
      u = stack[-1]
      pp(u:) if $debug
      if used[u]
        stack.pop

        unless u2is[u]
          u2is[u] = i
          ordered_us << u
          i += 1
        end
      else
        paths[u].each do |v, t|
          stack << v unless used[v]
        end
        used[u] = true
      end
    end
  end

  pp(ordered_us:) if $debug

  u2is = []

  ordered_us.each.with_index do |u, i|
    dp = [u]
    while 0 < dp.length
      u = dp.pop
      unless u2is[u]
        u2is[u] = i
        paths[u].each do |v, t|
          dp << v unless u2is[v]
        end
      end
    end
  end

  pp(u2is:) if $debug


  paths.each.with_index do |vts, u|
    i_u = u2is[u]
    vts.each do |v, t|
      if t == 1 && i_u == u2is[v]
        return false
      end
    end
  end

  u2is.map { |i| N - i }
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
    unless rs[u - 1] + t <= rs[v - 1]
      puts "#{t} #{u} #{v} : NG"
    else
      puts "#{t} #{u} #{v} : OK"
    end
  end
end


# > 2 1 1 1 1 1 1 2 2 1 1 3 1 2 2
# > 1 0 0 0 0 0 0 1 1 0 0 2 0 1 1
