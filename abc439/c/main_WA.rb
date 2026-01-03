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

def calc(n)
  n2 = Math.sqrt(10000000).to_i
  y2s = (1..n2).map { |y| y ** 2 }
  pp(y2s:) if $debug
  rs = {}
  y2s.each.with_index do |y2, yi|
    pp(y2:, yi:) if $debug
    y2s[0...yi].each.with_index do |x2, xi|
      pp(x2:, xi:) if $debug
      if x2 + y2 <= n
        rs[x2 + y2] = true
      end
    end
    pp(rs:) if $debug
  end
  rs.keys.sort
end

rs = calc(N)
pp(rs:) if $debug
puts rs.length
puts rs.join(' ')
