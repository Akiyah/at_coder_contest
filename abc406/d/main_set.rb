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

cleaned_columns = Set.new
cleaned_rows = Set.new

XYS.each do |x, y|
  x -= 1
  y -= 1
  map_columns[x] ||= Set.new
  map_columns[x] << y
  map_rows[y] ||= Set.new
  map_rows[y] << x
end

pp(map_columns:) if $debug
pp(map_rows:) if $debug

QUERIES.each do |t, i|
  if t == 1
    x = i - 1

    if cleaned_columns.include?(x)
      puts 0
    else
      cleaned_columns << x
      puts ((map_columns[x] || Set.new) - cleaned_rows).length
    end
  else # t == 2
    y = i - 1

    if cleaned_rows.include?(y)
      puts 0
    else
      cleaned_rows << y
      puts ((map_rows[y] || Set.new) - cleaned_columns).length
    end
  end
end

