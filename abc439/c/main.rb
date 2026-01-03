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
  y2s = []
  (1..10000000).each do |y|
    break if n < y ** 2
    y2s << y ** 2
  end
  pp(y2s:) if $debug
  rs = {}
  us = {}
  y2s.each.with_index do |y2, yi|
    pp(y2:, yi:) if $debug
    y2s[0...yi].each.with_index do |x2, xi|
      pp(x2:, xi:) if $debug
      if x2 + y2 <= n
        if us[x2 + y2]
          rs.delete(x2 + y2) if rs[x2 + y2]
        else
          rs[x2 + y2] = true
          us[x2 + y2] = true
        end
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
