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

N, K = STDIN.gets.chomp.split.map(&:to_i)
LAS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
CS = STDIN.gets.chomp.split.map(&:to_i)

LS = LAS.map { |las| las[0] }
ASS = LAS.map { |las| las[1..] }

pp(N:, K:) if $debug
pp(LAS:) if $debug
pp(CS:) if $debug
pp(LS:) if $debug
pp(ASS:) if $debug


def calc()
  k = K - 1

  CS.each.with_index do |c, i|
    if c * LS[i] <= k
      k -= c * LS[i]
    else
      if $debug
        pp(ASS[i])
        pp(k:)
        pp(LS[i])
        pp(k % LS[i])
      end
      return ASS[i][k % LS[i]]
    end
  end
end


puts calc()

