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
QRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

Q = STDIN.gets.chomp.to_i
TDS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


TDS.each do |t, d|
  q, r = QRS[t - 1]
  x = (d % q)
  y = d / q
  z = (x <= r) ? 0 : 1
  puts q * (y + z) + r
end
