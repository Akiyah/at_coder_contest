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

# trees = []
zero_trees = 0
ds = []
Q.times do
  t, v = STDIN.gets.chomp.split
  pp [t, v] if $debug
  if t == '1'
    # trees << 0
    zero_trees += 1
    pp ['zero_trees', zero_trees] if $debug
  elsif t == '2'
    # trees.map! { |tree| tree + v.to_i }
    ds << [zero_trees, v.to_i]
    zero_trees = 0
    pp ['ds', ds] if $debug
    pp ['zero_trees', zero_trees] if $debug
  else
    if v.to_i == 0
      c_sum = ds.sum { |c, d| c }
      puts c_sum + zero_trees
      ds = []
      zero_trees = 0
      next
    end

    # j = ds.rindex { |c, c_sum, d, d_sum| v.to_i <= d_sum }
    s = 0
    j = ds.reverse.find_index do |c, d|
      s += d
      v.to_i <= s
    end

    if j.nil?
      puts 0
    else
      j2 = ds.size - j - 1
      c_sum = ds[0..j2].sum { |c, d| c }
      puts c_sum
      ds = ds[(j2 + 1)..]
      pp ['ds', ds] if $debug
    end
    # j = trees.find_index { |tree| tree < v.to_i }
    # if j.nil?
    #   j = trees.size
    # end
    # # pp j if $debug
    # trees = trees[j..]
    # puts j
  end
end
