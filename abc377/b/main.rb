#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

SS = (1..8).map do
  STDIN.gets.chomp.split('')
end

rs = (1..8).map do |i|
  (1..8).map do |j|
    true
  end
end

SS.each_with_index do |line, i|
  line.each_with_index do |s, j|
    next if s == '.'
    (0...8).each do |k|
      rs[i][k] = false
      rs[k][j] = false
    end
  end
end
pp rs if $debug

c = 0
rs.each do |line|
  line.each do |p|
    c += 1 if p
  end
end

puts c
