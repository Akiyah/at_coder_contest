#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, W = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
TAS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


$columns = Array.new(W) { [] }

XYS.each_with_index do |xy, i|
  x, y = xy
  $columns[x - 1] << [i, x - 1, y - 1]
end

$j_max = 0
$columns_index = []
$columns.each do |ixys|
  ixys.sort_by! { |ixy| ixy[2] }
  ixys.each_with_index do |ixy, j|
    $j_max = j if $j_max < j
    i, x, y = ixy
    $columns_index[i] = { x:, y:, j: }
  end
end

pp $columns if $debug
pp $columns_index if $debug

$max_ts = []
(0..$j_max).each do |j|
  if (0...W).all? { |w| $columns[w][j] }
    $max_ts[j] = (0...W).map { |w| $columns[w][j][2] }.max
  end
end

pp $max_ts if $debug

def check(t, i)
  # x, y = XYS[i]
  # i, _x, _y = $columns[x - 1]
  # pp [[x, y], [i, _x, _y]] if $debug
  j = $columns_index[i][:j]
  !($max_ts[j] && $max_ts[j] < t)
  # if (0...W).all? { |w| $columns[w][j] && $columns[w][j][2] < t }
  #   return false
  # end

  # true
end


TAS.each do |t, a|
  puts check(t, a - 1) ? 'Yes' : 'No'
end

