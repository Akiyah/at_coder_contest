#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, M = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

r = 0
lines = {}
UVS.each do |u, v|
  lines[u] ||= {}
  lines[v] ||= {}

  if lines[u][v] || lines[v][u] || u == v
    r += 1
  else
    lines[u][v] = true
    lines[v][u] = true
  end
end

puts r

