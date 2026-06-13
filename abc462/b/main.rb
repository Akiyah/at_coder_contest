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
KAS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



rs = {}
KAS.each.with_index do |kas, i|
  k, *as = kas
  pp(k:, as:, i:) if $debug

  as.each do |a|
    rs[a] ||= []
    rs[a] << i + 1
  end

  pp(rs:) if $debug
end

pp(rs:) if $debug


(1..N).each do |j|
  bs = rs[j] || []
  puts ([bs.length] + bs.sort).join(' ')
end
