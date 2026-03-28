#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

pq = AcLibraryRb::PriorityQueue.new {|x, y| x < y }

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

Q = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


tree_count = 0
Q.times do
  t, h = STDIN.gets.chomp.split.map(&:to_i)
  pp(t:, h:) if $debug
  if t == 1
    pq.push(h)
    tree_count += 1
  else # t == 2
    while 0 < tree_count && pq.get <= h
      pq.pop
      tree_count -= 1
    end
  end
  puts tree_count
end


