#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


gs = Array.new(N) { 0 }
ABS.each do |a, b|
  i = (a + b - 1) % N
  gs[i] += 1
end

pp gs if $debug

r = M * (M - 1) / 2

gs.each do |g|
  r -= g * (g - 1) / 2
end

puts r

