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


N, M = STDIN.gets.chomp.split.map(&:to_i)

XYCS = (1..M).map do
  x, y, c = STDIN.gets.chomp.split
  [x.to_i, y.to_i, c]
end


def calc()
  b_max_by_y = {}
  w_min_by_y = {}
  ys = {}
  XYCS.each do |x, y, c|
    ys[y] = true
    if c == 'W'
      if !w_min_by_y[y] || x < w_min_by_y[y]
        w_min_by_y[y] = x
      end
    end
    if c == 'B'
      if !b_max_by_y[y] || b_max_by_y[y] < x
        b_max_by_y[y] = x
      end
    end
  end

  pp ys if $debug

  last_b_max = nil
  ys.keys.sort.each do |y|
    b_max = b_max_by_y[y] # nilは無限大
    w_min = w_min_by_y[y]
    if b_max && w_min && w_min < b_max
      return false
    end

    if last_b_max && b_max && last_b_max < b_max
      return false
    end

    if w_min
      if last_b_max
        last_b_max = [w_min - 1, last_b_max].min
      else
        last_b_max = w_min - 1
      end
    end
  end

  true
end

puts calc() ? 'Yes' : 'No'


