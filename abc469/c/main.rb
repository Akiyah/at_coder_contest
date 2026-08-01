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
S = STDIN.gets.chomp

is = []
S.chars.each.with_index do |c, i|
  if c == 'x'
    is << i + 1
  end
end
pp(is:) if $debug

rs = []
N.times do |j|
  rs << (is[j] || N)
end

pp(rs:) if $debug
rs.each do |r|
  puts r
end

