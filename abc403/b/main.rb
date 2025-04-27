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

T = STDIN.gets.chomp
U = STDIN.gets.chomp

def calc
  ts = T.split('')
  us = U.split('')


  n = ts.length
  m = us.length

  (0..(n - m)).each do |i|

    r = (0...m).all? do |j|
      ts[i + j] == '?' || ts[i + j] == us[j]
    end
    return true if r

  end

  false
end


puts calc ? 'Yes' : 'No'


