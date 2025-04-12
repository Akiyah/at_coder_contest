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
SS = (1..N).map do
  STDIN.gets.chomp
end


login = false
r = 0
SS.each do |s|
  if s == 'login'
    login = true
  elsif s == 'logout'
    login = false
  elsif s == 'public'
  else # s == 'private'
    r += 1 unless login
  end
end


puts r

