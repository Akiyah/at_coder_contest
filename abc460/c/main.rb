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

N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  as = AS.sort.reverse
  bs = BS.sort.reverse
  pp(as:, bs:) if $debug


  r = 0
  i = 0
  as.each do |a|
    while a * 2 < bs[i]
      i += 1
      return r if i == M
    end
    r += 1
    i += 1
    return r if i == M
  end

  r
end

puts calc



