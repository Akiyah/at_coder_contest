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

N, M, K = STDIN.gets.chomp.split.map(&:to_i)
HS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)


def calc
  hs = HS.sort
  bs = BS.sort
  pp(hs:) if $debug
  pp(bs:) if $debug

  i = 0
  K.times do |j|
    h = hs[j]
    pp(h:, j:) if $debug
    return false if M - 1 < i
    while bs[i] < h
      i += 1
      return false if M - 1 < i
    end
    pp(h:, b: bs[i], i:) if $debug

    i += 1
  end

  true
end


puts calc ? 'Yes' : 'No'