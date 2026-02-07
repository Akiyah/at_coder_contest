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
AS = STDIN.gets.chomp.split.map(&:to_i)



def calc_1(as)
  pp(as:) if $debug
  n = as.length
  return nil unless n % 2 == 0

  m = n / 2
  l = as[0] + as[-1]
  pp(l:) if $debug
  m.times do |i|
    return nil unless as[i] + as[-(i + 1)] == l
  end

  l
end

def calc
  as = AS.sort
  a_max = as[-1]
  rs = []

  # l = a_max の場合
  as2 = as.select { |a| a < a_max }
  if as2.length == 0 || a_max == calc_1(as2)
    rs << a_max
  end

  l = calc_1(as)
  rs << l if l

  rs
end



puts calc.join(' ')