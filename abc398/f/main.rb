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

  (n..1).step(-1).each do |m|
    x = r[0...m]
    if x == x.reverse
      return S[0...(n - m)] + x + S[0...(n - m)].reverse
    end
  end
end


puts calc

