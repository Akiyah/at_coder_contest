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

X, Y = STDIN.gets.chomp.split

if X == Y
  puts 'Yes'
else
  if X == 'Ocelot'
    puts 'No'
  elsif X == 'Serval'
    puts Y == 'Ocelot' ? 'Yes' : 'No'
  else
    puts 'Yes'
  end
end

