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
XS = STDIN.gets.chomp.split.map(&:to_i)

def calc_l(i)
  if i == 0
    return (XS[N - 1] - XS[0]) / 2
  end

  t1 = (XS[i] - XS[i - 1]) / 2
  t2_1 = (XS[N - 1] - XS[i]) / 2
  t2_2 = (XS[i - 1] - XS[0]) / 2

  t1 + [t2_1, t2_2].max
end


def calc_r(i)
  if i == N - 1
    return (XS[N - 1] - XS[0]) / 2
  end

  t1 = (XS[i + 1] - XS[i]) / 2
  t2_1 = (XS[N - 1] - XS[i + 1]) / 2
  t2_2 = (XS[i] - XS[0]) / 2

  t1 + [t2_1, t2_2].max
end

def calc(i)
  [calc_l(i), calc_r(i)].min
end


N.times do |i|
  puts calc(i)
end

