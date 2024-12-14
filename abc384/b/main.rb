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


N, R = STDIN.gets.chomp.split.map(&:to_i)
DAS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

r = R
DAS.each do |d, a|
  if d == 1 && 1600 <= r && r <= 2799
    r += a
  end
  if d == 2 && 1200 <= r && r <= 2399
    r += a
  end
end

puts r
