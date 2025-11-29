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

T = STDIN.gets.chomp.to_i


def check(n, h, tlus)
  l1 = h
  u1 = h
  t1 = 0
  i = 0
  tlus.each do |t, l, u|
    dt = t - t1
    u1_new = [u1 + dt, u].min
    l1_new = [l1 - dt, l, 1].max
    return false unless l1_new <= u1_new

    u1 = u1_new
    l1 = l1_new
    t1 = t
  end

  true
end

T.times do
  n, h = STDIN.gets.chomp.split.map(&:to_i)
  tlus = (1..n).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end
  r = check(n, h, tlus)
  puts r ? 'Yes' : 'No'
end



