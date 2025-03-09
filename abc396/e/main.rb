#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
XYZS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



def calc_one(group, paths)
  rs = {}

  if group.length == 1
    return { group[0] => 0 }
  end

  x = group[0]
  rs[x] = 0
  xs = [x]
  while 0 < xs.length
    x = xs.shift
    paths[x].each do |y, z|
      if rs[y]
        if rs[y] != rs[x] ^ z
          p("e3", {x:, y:, z:, rs:}) if $debug
          return nil
        end
      else
        rs[y] = rs[x] ^ z
        xs << y
      end
    end
  end
  rs

  pp rs if $debug

  r_max = rs.values.max
  l = r_max.digits(2).length

  dss = rs.map do |x, u|
    u.digits(2)
  end

  pp dss if $debug

  u2 = 0
  (0...l).each do |i|
    s = dss.map { |ds| ds[i] || 0 }.sum
    pp({u2:, i:, s:}) if $debug
    if l < s * 2
      u2 += (1 << i)
    end
  end

  pp rs if $debug
  pp({r_max:, l:, u2:}) if $debug
  rs = rs.transform_values { |u| u ^ u2 }
  pp rs if $debug
  rs
end


def calc
  paths = {}
  dsu = AcLibraryRb::DSU.new(N)
  XYZS.each do |x, y, z|
    if x == y && z != 0
      pp "e1" if $debug
      return nil
    end
    if paths[x - 1] && paths[x - 1][y - 1] && paths[x - 1][y - 1] != z
      pp "e2" if $debug
      return nil
    end

    paths[x - 1] ||= {}
    paths[x - 1][y - 1] = z
    paths[y - 1] ||= {}
    paths[y - 1][x - 1] = z
    dsu.merge(x - 1, y - 1)
  end

  pp dsu.groups if $debug

  rs = {}
  dsu.groups.each do |group|
    rs_one = calc_one(group, paths)
    if !rs_one
      pp "e3" if $debug
      return nil
    end
    rs.merge!(rs_one)
    pp rs if $debug
  end

  (0...N).map { |i| rs[i] }
end


rs = calc

puts rs ? rs.join(' ') : -1
