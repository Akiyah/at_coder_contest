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
CLS = (1..N).map do
  c, l = STDIN.gets.chomp.split
  [c, l.to_i]
end

def calc()
  r = ''
  s = 0
  CLS.each do |c, l|
    s += l
    return 'Too Long' if 100 < s
    r += c * l
  end

  r
end

puts calc()

