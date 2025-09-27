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
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  as2 = AS.select { |a| -1 < a }

  pp(as2:) if $debug
  return false if as2.length != as2.uniq.length
  
  bs = (1..N).to_a
  bs -= as2

  rs = []
  AS.each do |a|
    if a == -1
      rs << bs.pop
    else
      rs << a
    end
  end

  rs
end


rs = calc
if rs
  puts 'Yes'
  puts rs.join(' ')
else
  puts 'No'
end


