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
S = STDIN.gets.chomp
T = STDIN.gets.chomp
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

ss = S.chars
ts = T.chars

ms = []
LRS.each { |l, r| ms << l - 1 }
LRS.each do |l, r|
  ms << r + 1 - 1 if r + 1 - 1 < N
end

ms = ms.sort
pp(ms:) if $debug

mcs = ms.group_by {|i| i}.transform_values(&:count)
ms2 = []
mcs.each do |m, c|
  ms2 << m unless c % 2 == 0
end

b = true
rs = []
last_m = 0
ms2.each do |m|
  if last_m < m
    if b
      rs += ss[last_m...m]
    else
      rs += ts[last_m...m]
    end
  end

  b = !b
  last_m = m
end

if last_m < N
  if b
    rs += ss[last_m..]
  else
    rs += ts[last_m..]
  end
end

pp(rs:) if $debug
puts rs.join('')

