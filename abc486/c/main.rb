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
S = STDIN.gets.chomp

cs = S.chars

r = 0
N.times do |i|
  pp(i:) if $debug
  if cs[i] == 'o'
    cs[i] = '.'
    r += 1

    j = i + K
    while j < N && cs[j] == 'o'
      cs[j] = '.'
      j += K
    end
  end
  pp(r:, cs:) if $debug
end

puts r
