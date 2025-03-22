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

AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  AS.combination(5).each do |as|
    as.sort!
    bs = as.select{|a| a == as[0]}
    if as.uniq.length == 2 && (bs.length == 2 || bs.length == 3)
      return true
    end
  end

  false
end



puts calc ? 'Yes' : 'No'
