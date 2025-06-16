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

# N = STDIN.gets.chomp.to_i
N, H, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end




def calc

  hms = [[H, M]]
  r = 0
  ABS.each do |a, b|
    hms_new = []
    hms.each do |h, m|
      hms_new << [h - a, m] if a <= h
      hms_new << [h, m - b] if b <= m
    end

    return r if hms_new.length == 0

    hms = hms_new
    r += 1
  end

  r
end




puts calc
