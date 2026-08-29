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


h = AS.tally
pp(h:) if $debug

vs = h.values
pp(vs:) if $debug
h2 = vs.tally
pp(h2:) if $debug

if h2.length == 1
  k = h2.keys[0]
  puts h2[k]
else

  ks = h2.keys.sort
  # vks = {}
  # h.each do |k, v|
  #   vks[v] ||= 0
  #   vks[v] += 1
  # end
  # pp(vks:) if $debug

  k1 = ks[-1]
  k2 = ks[-2]
  pp(k1:, k2:) if $debug

  if k1 == k2 + 1
    puts h2[k1] + h2[k2]
  else
    puts h2[k1]
  end
end