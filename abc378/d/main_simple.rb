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

H, W, K = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.split('')
end

pp [H, W, K] if $debug
pp SS if $debug

def calc_one(i, j, k, foots)
  return 0 if i < 0 || H <= i
  return 0 if j < 0 || W <= j
  return 0 if SS[i][j] == '#'
  return 0 if foots.include?([i, j])

  return 1 if k == 0

  r = 0
  r += calc_one(i + 1, j, k - 1, foots + [[i, j]])
  r += calc_one(i - 1, j, k - 1, foots + [[i, j]])
  r += calc_one(i, j + 1, k - 1, foots + [[i, j]])
  r += calc_one(i, j - 1, k - 1, foots + [[i, j]])
end

def calc
  r = 0
  (0...H).each do |i|
    (0...W).each do |j|
      r += calc_one(i, j, K, [])
      pp [i, j, calc_one(i, j, K, [])] if $debug
    end
  end
  r
end



puts calc
