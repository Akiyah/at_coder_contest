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

M, D = STDIN.gets.chomp.split.map(&:to_i)
y, m, d = STDIN.gets.chomp.split.map(&:to_i)

pp [M, D, y, m, d] if $debug

d += 1

if D < d
  d = 1
  m += 1
end

if M < m
  m = 1
  y += 1
end

puts [y, m, d].join(' ')