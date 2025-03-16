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

S = STDIN.gets.chomp


r = 0
last_s = 'o'
S.split('').each do |s|
  if s == last_s
    r += 1
  end
  last_s = s
end

if last_s == 'i'
  r += 1
end

puts r
