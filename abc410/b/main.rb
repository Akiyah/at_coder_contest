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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
XS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  rs = []
  bs = [0] * N

  pp(N:, Q:, XS:) if $debug

  XS.each.with_index do |x, i|
    if x == 0
      m = bs.min
      x2 = bs.find_index(m)
      pp(m:, x2:) if $debug
      bs[x2] += 1
      rs << x2 + 1
    else
      bs[x - 1] += 1
      rs << x
    end
    pp(x:, i:, rs:, bs:) if $debug
  end

  rs
end

rs = calc
puts rs.join(' ')
