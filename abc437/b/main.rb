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

H, W, N = STDIN.gets.chomp.split.map(&:to_i)
AS = (1..H).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
BS = (1..N).map do
  STDIN.gets.chomp.to_i
end

pp(AS:, BS:) if $debug

lines = []
AS.each.with_index do |line, i|
  line.each do |a|
    lines[a] = i
  end
end

counts = Array.new(N, 0)
BS.each do |b|
  i = lines[b]
  if i
    counts[i] += 1
  end
end

puts counts.max
