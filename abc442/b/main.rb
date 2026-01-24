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

Q = STDIN.gets.chomp.to_i
AS = (1..Q).map do
  STDIN.gets.chomp.to_i
end

vol = 0
play = false
AS.each do |a|
  if a == 1
    vol += 1
  elsif a == 2
    vol -= 1 if 1 <= vol
  else # a == 3
    play = !play
  end

  puts (3 <= vol && play) ? 'Yes' : 'No'

end

