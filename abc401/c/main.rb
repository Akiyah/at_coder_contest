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


if N < K
  puts 1
elsif N == K
  puts K
else K < N
  rs = [1] * K
  rs << K
  ((K + 1)..N).each do |i|
    pp rs if $debug
    r_i_k = rs.shift
    r_i = rs[-1]
    r_i_1 = 2 * r_i - r_i_k
    rs << r_i_1 % (10 ** 9)
  end
  pp rs if $debug
  puts rs[-1]
end

