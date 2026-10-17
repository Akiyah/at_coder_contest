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

S11, S12 = STDIN.gets.chomp.chars
S21, S22 = STDIN.gets.chomp.chars
pp(S11:, S12:, S21:, S22:) if $debug

if S11 == 'A' && S22 == 'D'
  puts 'No'
elsif S12 == 'A' && S21 == 'D'
  puts 'No'
elsif S21 == 'A' && S12 == 'D'
  puts 'No'
elsif S22 == 'A' && S11 == 'D'
  puts 'No'
else
  puts 'Yes'
end

