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
  ns = {}
  ns[n] = true
  while true
    pp(ns:) if $debug
    n2 = n.to_s.chars.map(&:to_i).map { |i| i ** 2}.sum
    pp(n2:) if $debug
    if n2 == 1
      return true
    end
    if ns[n2]
      return false
    end
    n = n2
    ns[n] = true
  end
end

puts calc(N) ? 'Yes' : 'No'



