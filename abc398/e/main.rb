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
UVS = (1...N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


# $stdout.flush

paths = {}
paths2 = {}
UVS.each do |u, v|
  paths[u] ||= []
  paths[u] << v
  paths[v] ||= []
  paths[v] << u
  paths2[u] ||= {}
  paths2[u][v] = true
  paths2[v] ||= {}
  paths2[v][u] = true
end

pp({paths:}) if $debug

edges = {}

cps = [{ current: 1, parent: nil }]
parents = { 1 => nil}
d = 0
depths = {}

while 0 < cps.length
  next_cps = []
  cps.each do |cp|
    u = cp[:current]
    parent = cp[:parent]

    depths[u] = d

    children = paths[u] - [parent]
    children.each { |child| parents[child] = u }
    if children.length == 0
    else
      next_cps += children.map{|child| { current: child, parent: u } }
    end
  end
  d += 1
  cps = next_cps
end

pp({parents:, depths:}) if $debug

pairs = {}
count = 0
(1..N).each do |u|
  ((u + 1)..N).each do |v|
    next if paths2[u][v]

    if (depths[u] + depths[v]) % 2 == 0
    else
      pairs[u] ||= {}
      pairs[u][v] = true
      count += 1
    end
  end
end

pp({pairs:, count:}) if $debug


if count % 2 == 0
  puts 'Second'
  STDOUT.flush
else
  puts 'First'
  STDOUT.flush

  u = pairs.keys.first
  v = pairs[u].keys.first
  puts "#{u} #{v}"
  STDOUT.flush

  pairs[u].delete(v)
  if pairs[u].length == 0
    pairs.delete(u)
  end
end

def game(pairs)
  while true
    u, v = STDIN.gets.chomp.split.map(&:to_i)
    pp({player: '2', u:,v:}) if $debug

    return if u == -1 && v == -1 

    u, v = v, u if v < u

    pairs[u].delete(v)
    if pairs[u].length == 0
      pairs.delete(u)
    end

    u = pairs.keys.first
    v = pairs[u].keys.first
    puts "#{u} #{v}"
    STDOUT.flush

    pairs[u].delete(v)
    if pairs[u].length == 0
      pairs.delete(u)
    end


    pp({player: '1', u:,v:}) if $debug
  end
end


game(pairs)



