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

MOD = 998244353

N = STDIN.gets.chomp.to_i

r = 0
(1..N).each do |x|
  b1 = 0
  b2 = 0
  b3 = 0
  # pp(x:) if $debug
  b1 = 1 if x % 3 == 0
  cs = x.to_s.chars
  # pp(cs:) if $debug
  b2 = 1 if cs.include?('3')
  ds = cs.tally
  pp(ds:) if $debug

  b3 = 1 if ds.keys.length == 3

  b = ((b1 + b2 + b3) == 1)

  r += 1 if b
  pp(x:, b: [b1, b2, b3], r:) if $debug
end


puts r % MOD
