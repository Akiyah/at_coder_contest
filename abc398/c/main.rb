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
AS = STDIN.gets.chomp.split.map(&:to_i)


rs = {}
# qs = {}
ds = {}
AS.each_with_index do |a, i|
  if rs[a] || ds[a]
    rs.delete(a)
    ds[a] = true
  else
    rs[a] = i + 1
    # qs[i + 1] = a
  end
  pp({a:, rs:, ds:}) if $debug
end

pp rs if $debug



if rs.values.length == 0
  puts -1
else
  r = rs.keys.max
  puts rs[r]
end

