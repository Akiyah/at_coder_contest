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

H, W = STDIN.gets.chomp.split.map(&:to_i)

H.times.map do |i|
  rs = W.times.map do |j|
    r = 0

    if H == 1
      r += 0
    elsif 0 == i || i == H - 1
      r += 1
    else
      r += 2
    end
    if W == 1
      r += 0
    elsif 0 == j || j == W - 1
      r += 1
    else
      r += 2
    end
    r
  end
  puts rs.join(' ')
end

