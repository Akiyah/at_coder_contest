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
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

as = AS
BS.each do |b|
  i = as.find_index(b)
  if i
    as = as[0...i] + as[(i + 1)..]
  end
end

puts as.join(' ')


