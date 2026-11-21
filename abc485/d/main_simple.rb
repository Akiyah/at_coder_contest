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


def calc
  r = 0
  (0..(N - 3)).each do |i|
    ((i + 1)..(N - 2)).each do |j|
      s1 = S[0..i]
      s2 = S[(i + 1)..j]
      s3 = S[(j + 1)..]
      b1 = s1.include?('A') && s1.include?('B') && s1.include?('C')
      b2 = s2.include?('A') && s2.include?('B') && s2.include?('C')
      b3 = s3.include?('A') && s3.include?('B') && s3.include?('C')
      r += 1 if b1 && b2 && b3
    end
  end
  r
end


r = calc
puts r
