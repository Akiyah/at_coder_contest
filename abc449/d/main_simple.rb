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

L, R, D, U = STDIN.gets.chomp.split.map(&:to_i)

ans = 0
(L..R).each do |x|
  (D..U).each do |y|
    m = [x.abs, y.abs].max
    ans += 1 if m % 2 == 0
  end
end

puts ans