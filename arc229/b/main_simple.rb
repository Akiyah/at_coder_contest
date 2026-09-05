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
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def calc(n, as)
  pp(n:, as:) if $debug
  r = 0
  while 0 < as.sum
    us = as.map.with_index { |a, i| (a + 1) * (2 ** i) - 1 }
    # ds = as.map.with_index { |a, i| a * (2 ** i) }
    pp(as:, us:) if $debug

    if us.min == 0
      return -1
    end

    r += 1

    u = us.min
    as = as.map.with_index { |a, i| a - (u >> i) }
    pp(u:, as:) if $debug
  end
  
  r
end



T.times do
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, as)

end


