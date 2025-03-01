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
OPS = (1..Q).map do
  STDIN.gets.chomp.split
end


ps = {}
(1..N).each do |a|
  ps[a] = a
end

OPS.each do |i, a, b|
  if i == '1'
    a = a.to_i
    b = b.to_i
    ps[a] = b
  elsif i == '2'
    a = a.to_i
    b = b.to_i
    (1..N).each do |c|
      if ps[c] == a
        ps[c] = b
      elsif ps[c] == b
        ps[c] = a
      else
      end
    end
  else # i == '3'
    a = a.to_i
    puts ps[a]
  end

  pp [i, a, b, ps] if $debug
end

