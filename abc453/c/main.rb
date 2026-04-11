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
LS = STDIN.gets.chomp.split.map(&:to_i)



def calc_one(x, d)
  return 0 if d == N

  l = LS[d]

  r1 = calc_one(x + l, d + 1)
  if x * (x + l) < 0
    r1 += 1
  end
  r2 = calc_one(x - l, d + 1)
  if x * (x - l) < 0
    r2 += 1
  end

  [r1, r2].max
end

def calc
  calc_one(0.5, 0)
end



puts calc
