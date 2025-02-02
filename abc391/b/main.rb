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

SS = (1..N).map do
  STDIN.gets.chomp.split('')
end
TS = (1..M).map do
  STDIN.gets.chomp.split('')
end


def check(a, b)
  (0...M).each do |i|
    (0...M).each do |j|
      return false unless TS[i][j] == SS[i + a][j + b]
    end
  end
  true
end

def calc
  d = N - M
  (0..d).each do |a|
    (0..d).each do |b|
      return [a + 1, b + 1] if check(a, b)
    end
  end
end


puts calc.join(' ')