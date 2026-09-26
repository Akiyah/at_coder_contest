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
QUERIES = Q.times.map do
  a, b = STDIN.gets.chomp.split
  [a, b]
end

board = ['a'] * N
tiles = [false] * N

QUERIES.each.with_index do |(a, b), i|
  if a == '1'
    x = b.to_i - 1
    tiles[x] = !tiles[x]
  end
end


tile_indexes = Set.new []
non_tile_indexes = Set.new []
tiles.each.with_index do |t, i|
  if t
    tile_indexes << i
  else
    non_tile_indexes << i
  end
end

fixed_colors = []
pp(tile_indexes:, non_tile_indexes:, fixed_colors:) if $debug

QUERIES.reverse.each.with_index do |(a, b), ir|
  if a == '1'
    x = b.to_i - 1
    tiles[x] = !tiles[x]
    b1 = tile_indexes.include?(x)
    b2 = non_tile_indexes.include?(x)
    if b1 || b2
      if b1
        tile_indexes.delete(x)
        non_tile_indexes << x
      else
        tile_indexes << x
        non_tile_indexes.delete(x)
      end
    end
  else
    c = b
    non_tile_indexes.each do |i|
      fixed_colors[i] = c
    end
    non_tile_indexes.clear
  end
end

non_tile_indexes.each do |i|
  fixed_colors[i] = 'a'
end


puts fixed_colors.join('')
