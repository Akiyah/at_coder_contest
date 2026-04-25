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
AS = STDIN.gets.chomp.split.map(&:to_i)


hs = {}
AS.each do |a|
  hs[a] ||= 0
  hs[a] += a
end
pp(hs:) if $debug

vs = hs.to_a.sort_by { |a, v| v }

pp(vs:) if $debug
pp(K:) if $debug

if vs.length <= K
  puts 0
else
  n = vs.length - K
  pp(n:) if $debug

  r = 0
  vs[0...n].each do |a, v|
    r += v
    pp(r:) if $debug
  end
  puts r
end



