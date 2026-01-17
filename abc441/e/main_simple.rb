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
S = STDIN.gets.chomp


ss = S.chars

r = 0
(0...N).each do |i|
  (i...N).each do |j|
    a_count = ss[i..j].select { |x| x == 'A' }.count
    b_count = ss[i..j].select { |x| x == 'B' }.count
    pp(ss[i..j], a_count, b_count) if $debug
    r += 1 if b_count < a_count
  end
end

puts r
