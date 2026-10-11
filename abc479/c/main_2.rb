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

N, W = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

as = ABS.map { |a, b| a}
bs = ABS.map { |a, b| b}


pp(ABS:) if $debug

r = (2 ** N).times.filter_map do |z|
  a_sum = 0
  b_sum = 0
  N.times do |i|
    if z[i] == 1
      a_sum += as[i]
      b_sum += bs[i]
    end
  end

  pp(z: z.to_s(2), a_sum:, b_sum:) if $debug
  a_sum if b_sum <= W
end.max

puts r
