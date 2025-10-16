#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 

require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def calc
  n, k, x = STDIN.gets.chomp.split.map(&:to_i)
  as = STDIN.gets.chomp.split.map(&:to_i)
  ais = as.map { |a| [a.to_r, 1] }
  pq = AcLibraryRb::PriorityQueue.new(ais) do |(a0, i0), (a1, i1)|
    a0 > a1
  end

  while 0 < k
    a, i = pq.pop
    if i < k
      k -= i
      pq.push([a / 2, i * 2])
    else
      pq.push([a / 2, k * 2])
      pq.push([a, i - k]) if 0 < i - k
      k = 0
    end
  end

  while true
    a, i = pq.pop
    if i < x
      x -= i
    else
      return a
    end
  end
end

T.times do
  r = calc
  puts sprintf('%.20f', r)
end

