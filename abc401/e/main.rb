#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 

require 'set'

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


dsu = AcLibraryRb::DSU.new(N)

paths = {}
r_paths = {}
UVS.each do |u, v|
  paths[u - 1] ||= Set.new
  paths[u - 1] << v - 1
  r_paths[v - 1] ||= Set.new
  r_paths[v - 1] << u - 1
end


rs = []
vs = Set.new # []
(0...N).each do |u|
  
  (r_paths[u] || []).each do |v|
    dsu.merge(u, v)
  end

  # vs = (vs + (paths[u] || []) - [u]).uniq # vsはu以下を含まない
  if paths[u]
    paths[u].each do |v|
      vs.add(v)
    end
    # vs += paths[u]
  end
  vs.delete(u) # vsはu以下を含まない

  pp({u:, dsu_l: dsu.groups.length, dsu_s: dsu.size(0), vs:, rs:, dsu: dsu.groups}) if $debug

  #if N - u < dsu.groups.length
  if dsu.size(0) < u + 1
    r = -1
  else
    r = vs.length
  end

  rs << r
end

rs.each do |r|
  puts r
end
