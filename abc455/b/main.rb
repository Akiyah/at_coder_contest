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

H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.chars
end

def check(i1, i2, j1, j2)
  (i1..i2).each do |i|
    (j1..j2).each do |j|
      return false unless SS[i][j] == SS[i1 + i2 - i][j1 + j2 - j]
    end
  end
  true
end

def main
  r = 0
  H.times do |i1|
    (i1...H).each do |i2|
      W.times do |j1|
        (j1...W).each do |j2|
          r += 1 if check(i1, i2, j1, j2)
        end
      end
    end
  end
  r
end


puts main()


