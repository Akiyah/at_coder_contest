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
MOD = 998244353





def calc
  r = 0
  (1..N).to_a.permutation(3).each do |a, b, c|
    pp(a:, b:, c:, f: a % b == c) if $debug
    if a % b == c
      # pp(a:, b:, c:) if $debug
      r += 1
    end
  end
  r
end


puts calc

