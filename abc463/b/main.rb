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

N, X = STDIN.gets.chomp.split
SS = (1..(N.to_i)).map do
  STDIN.gets.chomp
end

pp(N:, X:, SS:) if $debug

i = { 'A' => 0, 'B' => 1, 'C' => 2, 'D' => 3, 'E' => 4 }[X]

pp(i:) if $debug

r = SS.any? do |s|
  s[i] == 'o'
end

puts r ? 'Yes' : 'No'


