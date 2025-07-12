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

N, M = STDIN.gets.chomp.split.map(&:to_i)
XS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  xs = XS.uniq.sort
  pp(xs:) if $debug

  return 0 if xs.length == 1



  ds = []
  xs.each_cons(2) do |x1, x2|
    ds << x2 - x1
  end

  pp(ds:) if $debug

  l = xs[-1] - xs[0]
  ds2 = ds.sort.reverse[0...(M - 1)]
  pp(ds2:, l:) if $debug

  l - ds2.sum
end

puts calc

