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
S = STDIN.gets.chomp

def calc(ss, t)

  as = []
  bs = []

  (0...(2*N)).each do |i|
    if ss[i] == t
      as << i
    else
      bs << i
    end
  end

  r = 0
  (0...(2*N)).each do |i|
    t2 = (i % 2 == 0)
    if t2
      c = as[i / 2]
    else
      c = bs[i / 2]
    end
    unless c <= i
      r += c - i
    end
  end
  r
end



ss = S.chars.map { |s| s == 'A' }
r1 = calc(ss, true)
r2 = calc(ss, false)

puts [r1, r2].min




