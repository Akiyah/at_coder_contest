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

S = STDIN.gets.chomp


a = []
S.chars.each.with_index do |s, i|
  if s == '#'
    if a.length == 0
      a << i + 1
    else # 1
      a << i + 1
      puts a.join(',')
      a = []
    end
  else # s == '.'
  end
end





