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



def calc2n(n, i)

  m = (0...n).bsearch { |m| n < (2 ** i) * (2 * m - 1) ** 2 }

  pp({n:,i:,m:}) if $debug

  m - 1
end


def calc(n)
  r = 0
  (1..).each do |i|
    break if n < 2 ** i

    r += calc2n(n, i)
  end

  r
end


puts calc(N)
