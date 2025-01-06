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

L, R = STDIN.gets.chomp.split.map(&:to_i)


def snake?(i)
  as = i.to_s.split('').map(&:to_i)
  as[1..].all? { |a| a < as[0] }
end

def calc(l, r)
  (l..r).select do |i|
    snake?(i)
  end.length
end

puts calc(L, R)




