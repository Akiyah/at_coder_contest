#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
ADBS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


pluss = Array.new(M) { {} }
minuss = Array.new(M) { {} }
ADBS.each do |a, d, b|
  if 1 < d
    pluss[0][a] ||= 0
    pluss[0][a] += 1
    minuss[d - 1][a] ||= 0
    minuss[d - 1][a] += 1
    pluss[d - 1][b] ||= 0
    pluss[d - 1][b] += 1
  else # d == 0
    pluss[0][b] ||= 0
    pluss[0][b] += 1
  end
end


colors = {}
co = 0
cos = M.times.map do |d|
  pluss[d].each do |b, c|
    colors[b] ||= 0
    co += 1 if colors[b] == 0
    colors[b] += c
  end
  minuss[d].each do |a, c|
    colors[a] -= c
    co -= 1 if colors[a] == 0
  end
  co
end

cos.each do |co|
  puts co
end
