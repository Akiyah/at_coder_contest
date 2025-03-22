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
  n = ss.length
  
  r = S.reverse

  (0..n).each do |m|
    x = S + S[0...m].reverse
    pp({x:}) if $debug
    if x == x.reverse
      return x
    end
  end
end


puts calc

