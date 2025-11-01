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

N, M = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..N).map do
  STDIN.gets.chomp
end

ms = []
(0..(N - M)).each do |i|
  (0..(N - M)).each do |j|
    m = SS[i...(i + M)].map { |s| s[j...(j + M)] }.join('')
    ms << m
  end
end

puts ms.uniq.count
