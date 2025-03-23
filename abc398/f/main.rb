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

def calc
  ss = S.split('')
  rs = ss.reverse
  n = ss.length
  
  n.times do |i|
    if ss == rs
      return S[0...i] + ss.join('') + S[0...i].reverse
    end
    ss = ss[1..]
    rs = rs[...-1]
  end
end


puts calc

