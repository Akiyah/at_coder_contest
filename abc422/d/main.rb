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

N, K = STDIN.gets.chomp.split.map(&:to_i)

m = 2 ** N

def calc(m, p, q)
  rs = Array.new(2 ** N, p)

  q.times do |j|
    k = 0
    N.times do |n|
      k += 2 ** (N - n - 1) if j[n] == 1
    end
    rs[k] += 1
  end
  
  rs
end

rs = calc(m, K / m, K % m)

puts (K % m == 0) ? 0 : 1
puts rs.join(' ')



