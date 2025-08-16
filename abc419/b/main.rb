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

Q = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

xs = []
Q.times do
  type, x  = STDIN.gets.chomp.split.map(&:to_i)
  pp(type:, x:) if $debug
  if type == 1
    xs << x
    pp(xs:) if $debug
  else # type == 2
    pp(xs:) if $debug
    xs.sort!
    x = xs.shift
    puts x
  end
end


