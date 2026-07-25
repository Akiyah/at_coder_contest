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

cs = S.chars
n = cs.length

# def check(cs)
#   r = (cs == cs.reverse)
#   pp(cs:, r:) if $debug
#   r
# end

def check(cs)
  n = cs.length
  ng = 0
  (n / 2).times do |i|
    ng += 1 unless cs[i] == cs[n - 1 - i]
  end
  r = (ng <= 1)
  pp(cs:, r:) if $debug
  r
end

r = 0
(1..n).each do |d|
  (0..(n - d)).each do |i|
    if check(cs[i..(i + d - 1)])
      r += 1
    end
  end
end


puts r





