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
T = STDIN.gets.chomp


ss = S.split('')
ts = T.split('')

r = true
ss.each.with_index do |s, i|
  next if i == 0

  if 'A' <= s && s <= 'Z'
    r = false unless ts.include?(ss[i - 1])
  end
  pp(s:, r:) if $debug
end

puts r ? 'Yes' : 'No'

