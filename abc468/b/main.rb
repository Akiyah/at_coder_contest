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

M, D = STDIN.gets.chomp.split.map(&:to_i)
S = STDIN.gets.chomp


rs = []
cs = S.chars
j = nil
cs.each.with_index do |c, i|
  if c == 'G'
    j = i
  end
  if j && i <= j + D
    rs[i] = true
  end
end

j = nil
cs.reverse.each.with_index do |c, i2|
  i = M - 1 - i2
  if c == 'G'
    j = i
  end
  if j && j - D <= i
    rs[i] = true
  end
end

r = 0
M.times do |i|
  r += 1 if !rs[i]
end

puts r



