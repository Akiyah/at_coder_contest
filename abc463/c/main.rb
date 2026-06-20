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

N = STDIN.gets.chomp.to_i
HLS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i
TS = STDIN.gets.chomp.split.map(&:to_i)



max_h = 0
max_hls = []
HLS.reverse.each do |h, l|
  max_h = h if max_h < h
  max_hls << [max_h, l]
end
max_hls.reverse!

TS.each do |t|
  hl = max_hls.bsearch { |h, l| t < l }
  puts hl[0]
end



