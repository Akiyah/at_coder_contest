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

MOD = 998244353

def calc
  ss = S.chars
  l = ss.length

  r = 0
  i = 0
  j = 0

  l.times do |i|
    if 0 < i && ss[i] == ss[i - 1]
      j = i
    end

    r += (i - j + 1)
    r %= MOD
  end

  r %= MOD
  r
end


puts calc


