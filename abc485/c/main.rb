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
CS = STDIN.gets.chomp.split.map(&:to_i)

lefts = []
rights = []

last_c = nil
last_c_length = nil
CS.each.with_index do |c, i|
  if last_c
    if c != last_c
      last_c_length = 1
    else
      if last_c_length
        last_c_length += 1
      end
    end
  else
    last_c_length = nil
  end
  lefts[i] = last_c_length
  last_c = c
end

last_c = nil
last_c_length = nil
CS.reverse.each.with_index do |c, j|
  i = N - 1 - j
  if last_c
    if c != last_c
      last_c_length = 1
    else
      if last_c_length
        last_c_length += 1
      end
    end
  else
    last_c_length = nil
  end
  rights[i] = last_c_length
  last_c = c
end

pp(lefts:, rights:) if $debug

rs = []
N.times do |i|
  if lefts[i]
    if rights[i]
      rs[i] = [lefts[i], rights[i]].min
    else
      rs[i] = lefts[i]
    end
  else
    rs[i] = rights[i]
  end
end
pp(rs:) if $debug

puts rs.join(' ')