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

N, M = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..N).map do
  STDIN.gets.chomp
end
TS = (1..M).map do
  STDIN.gets.chomp
end


def check(t)
  N.times do |i|
    return i if SS[i] == t
  end

  is = []
  N.times do |i|
    if SS[i].length == t.length
      c = 0
      SS[i].chars.zip(t.chars).each do |c1, c2|
        c += 1 unless c1 == c2
      end
      if c == 1
        is << i
      end
    end
  end

  if is.length == 1
    is[0]
  else
    nil
  end
end

rs = Array.new(N, 0)
TS.each do |t|
  i = check(t)
  rs[i] += 1 if i
end

rs.each do |r|
  puts r
end



