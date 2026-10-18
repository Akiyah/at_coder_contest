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

def value(m, a, d)
  r = m.times.map do |i|
    a + i * d
  end.inject(:*)
  # pp(m:, a:, d:, r:) if $debug
  r
end

def calc_m(m)
  r = 0
  d_over_1 = 10 ** 9 + 1
  (1..(10 ** 6)).each do |a|
    d_over_1 = (1..d_over_1).bsearch { |d| N < value(m, a, d) }
    pp(m:, a:, d_over_1:, r:) if $debug
    return r if d_over_1 == 1
    r += d_over_1 - 1
  end
  r
end


def calc()
  r = 0
  (3..20).each do |m|
    dr = calc_m(m)
    r += dr
    pp(m:, dr:, r:) if $debug
  end
  r
end


r = calc()

puts r
