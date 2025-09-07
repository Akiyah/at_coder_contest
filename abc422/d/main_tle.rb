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

rs = Array.new(m, (K / m))

(K % m).times do |j|
  cs = j.to_s(2).reverse.chars.map(&:to_i)
  k = 0
  cs.each.with_index do |i, j|
    k += 2 ** (N - 1 - j) if i == 1
  end
  rs[k] += 1
end

puts (K % m == 0) ? 0 : 1
puts rs.join(' ')



