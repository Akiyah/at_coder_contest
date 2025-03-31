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

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

if M == 0
  puts 0
  exit
end

dsu = AcLibraryRb::DSU.new(N)

paths = {}
UVS.each do |u, v|
  paths[u - 1] ||= []
  paths[u - 1] << v - 1
  paths[v - 1] ||= []
  paths[v - 1] << u - 1
  dsu.merge(u - 1, v - 1)
end

pp({paths:, dsu:}) if $debug



def calc(paths, group)
  pp({group:}) if $debug

  return 0 if group.length <= 1


  cps = [{ current: group[0], parent: nil }]
  depths = {}
  depths[group[0]] = 0
  d = 1
  r = 0

  while 0 < cps.length
    next_cps = []
    cps.each do |cp|
      u = cp[:current]
      parent = cp[:parent]

      children = paths[u] - [parent]
      children.each do |child|
        if depths[child]
          r += 1
          paths[child].delete(u)
        else
          depths[child] = d
          next_cps << { current: child, parent: u }
        end
      end
    end
    d += 1
    cps = next_cps

    pp({d:, cps:}) if $debug
  end

  r
end

r = 0
dsu.groups.each do |group|
  r += calc(paths, group)
end

puts r

