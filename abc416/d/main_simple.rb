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



def calc_one(n, m, as, bs)
  rs = []
  as.permutation(n).each do |as2|
    rs << n.times.map do |i|
      (as2[i] + bs[i]) % m
    end.sum
  end
  rs.min
end


def calc()
  T.times do
    n, m = STDIN.gets.chomp.split.map(&:to_i)
    as = STDIN.gets.chomp.split.map(&:to_i)
    bs = STDIN.gets.chomp.split.map(&:to_i)

    puts calc_one(n, m, as, bs)
  end
end



calc

