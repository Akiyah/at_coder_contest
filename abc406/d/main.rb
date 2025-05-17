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

H, W, N = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
QUERIES = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


map_columns = {}
map_rows = {}

count_columns = Array.new(H, 0)
count_rows = Array.new(W, 0)

XYS.each do |x, y|
  x -= 1
  y -= 1
  count_columns[x] += 1
  count_rows[y] += 1
  map_columns[x] ||= {}
  map_columns[x][y] = true
  map_rows[y] ||= {}
  map_rows[y][x] = true
end

pp(map_columns:, map_rows:) if $debug


QUERIES.each do |t, i|
  if t == 1
    x = i - 1
    puts count_columns[x]

    if 0 < count_columns[x]
      count_columns[x] = 0
      map_columns[x].keys.each do |y|
        map_rows[y].delete(x)
        count_rows[y] -= 1
      end
      map_columns.delete(x)
    end
  else # t == 2
    y = i - 1
    puts count_rows[y]

    if 0 < count_rows[y]
      count_rows[y] = 0
      map_rows[y].keys.each do |x|
        map_columns[x].delete(y)
        count_columns[x] -= 1
      end
      map_rows.delete(y)
    end
  end

  pp(map_columns:, map_rows:) if $debug
end

