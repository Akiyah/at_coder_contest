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

S = STDIN.gets.chomp


h = S.chars.tally

m = h.values.max

ans = S.chars.map do |c|
  if h[c] == m
    nil
  else
    c
  end
end.compact.join('')

pp(ans:) if $debug

puts ans


