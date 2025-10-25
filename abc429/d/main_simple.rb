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

N, M, C = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

h = Array.new(M, 0)
AS.each do |a|
  h[a] += 1
end

def calc_xi(i, h)
  s = 0
  M.times do |j|
    s += h[(i + j) % M]
    return s if C <= s
  end
end

r = 0
M.times do |i|
  r += calc_xi(i, h)
end
puts r

