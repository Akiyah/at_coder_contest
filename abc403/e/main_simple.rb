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

Q = STDIN.gets.chomp.to_i
TSS = (1..Q).map do
  STDIN.gets.chomp.split
end

xs = []
ys = []
TSS.each do |t, s|
  if t == '1'
    xs << s
  else
    ys << s
  end
  pp({xs:, ys:}) if $debug

  r = ys.count do |y|
    xs.all? do |x|
      n = x.length
      y[0...n] != x
    end
  end

  puts r
end

