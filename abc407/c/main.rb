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



def calc(s)
  ss = s.split('').map(&:to_i)
  d = 0
  r = 0

  while 0 < ss.length
    pp(ss:, r:, d:,) if $debug
    s0 = ss.pop
    d0 = (s0 - d) % 10
    r += (d0 + 1)
    d += d0
    d %= 10
  end

  r
end



puts calc(S)
