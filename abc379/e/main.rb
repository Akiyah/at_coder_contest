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

N = STDIN.gets.chomp.to_i
S = STDIN.gets.chomp.to_i


def calc
  ss = S.to_s.split('').map(&:to_i)
  r = 0
  (0...N).each do |i|
    (i...N).each do |j|
      pp  if $debug
      pp [i, j, ss[i..j]] if $debug
      r += ss[i..j].join('').to_i
    end
  end
  r
end

puts calc
