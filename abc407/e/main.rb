#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/lazy_segtree"
# require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def calc(n, as)
  r = as[0]

  pq = AcLibraryRb::PriorityQueue.new()

  as[1...-1].each_slice(2) do |a1, a2|
    pq << a1
    pq << a2

    r += pq.pop
  end
  r
end


T.times do |t|
  n = STDIN.gets.chomp.to_i
  as = (2 * n).times.map do
    STDIN.gets.chomp.to_i
  end
  pp(t:, n:, as:) if $debug
  puts calc(n, as)
end


