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
SS = STDIN.gets.chomp.split


i = SS.map do |s|
  c = s[0]
  if ['a', 'b', 'c'].include?(c)
    2
  elsif ['d', 'e', 'f'].include?(c)
    3
  elsif ['g', 'h', 'i'].include?(c)
    4
  elsif ['j', 'k', 'l'].include?(c)
    5
  elsif ['m', 'n', 'o'].include?(c)
    6
  elsif ['p', 'q', 'r', 's'].include?(c)
    7
  elsif ['t', 'u', 'v'].include?(c)
    8
  else #  ['w', 'x', 'y', 'z'].include?(c)
    9
  end
end.join('')


puts i

