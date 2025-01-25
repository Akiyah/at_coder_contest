#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.split('')
end


def calc
  blacks = []
  whites = []
  blanks = []
  SS.each.with_index do |line, i|
    line.each.with_index do |s, j|
      if s == '#'
        blacks << [i, j]
      end
      if s == '.'
        whites << [i, j]
      end
      if s == '?'
        blanks << [i, j]
      end
    end
  end

  b_i_min = blacks.map { |i, j| i }.min
  b_i_max = blacks.map { |i, j| i }.max
  b_j_min = blacks.map { |i, j| j }.min
  b_j_max = blacks.map { |i, j| j }.max

  (b_i_min..b_i_max).each do |i|
    (b_j_min..b_j_max).each do |j|
      return false if SS[i][j] == '.'
    end
  end

  true
end


puts calc ? 'Yes' : 'No'

