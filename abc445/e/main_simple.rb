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

M = 998244353

T = STDIN.gets.chomp.to_i


def calc()
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)
  pp(n:, as:) if $debug

  rs = []
  n.times do |i|
    as2 = as[0...i] + as[(i + 1)..]
    pp(i:, as2:) if $debug
    rs << as2.inject(:lcm) % M
    pp(rs:) if $debug
  end

  rs
end



T.times do
  ans = calc()
  puts ans.join(' ')
end

