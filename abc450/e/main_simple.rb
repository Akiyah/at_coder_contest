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

X = STDIN.gets.chomp
Y = STDIN.gets.chomp
Q = STDIN.gets.chomp.to_i
LRCS = (1..Q).map do
  l, r, c = STDIN.gets.chomp.split
  [l.to_i, r.to_i, c]
end

ss = []
ss << X
ss << Y
10.times do
  ss << ss[-1] + ss[-2]
end
pp(ss:) if $debug

s = ss[-1]
LRCS.each do |l, r, c|
  pp(l:, r:, c:) if $debug
  puts s[(l - 1)..(r - 1)].chars.select { |x| x == c }.length

end

