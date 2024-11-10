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

Q = STDIN.gets.chomp.to_i

trees = []
Q.times do
  t, v = STDIN.gets.chomp.split
  pp [t, v] if $debug
  if t == '1'
    trees << 0
  elsif t == '2'
    trees.map! { |tree| tree + v.to_i }
  else
    j = trees.find_index { |tree| tree < v.to_i }
    if j.nil?
      j = trees.size
    end
    # pp j if $debug
    trees = trees[j..]
    puts j
  end
end
