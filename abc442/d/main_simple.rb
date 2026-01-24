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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc_1(x, as)
  as[x - 1], as[x] = as[x], as[x - 1]
end

def calc_2(l, r, as)
  as[(l - 1)..(r - 1)].sum
end

def calc
  as = AS.dup
  Q.times do
    t, x, y = STDIN.gets.chomp.split.map(&:to_i)
    if t == 1
      calc_1(x, as)
    else
      puts calc_2(x, y, as)
    end
  end
end


calc
