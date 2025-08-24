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

ts = Array.new(N, 0)
M.times do |j|
  x = N.times.select { |i| SS[i][j] == '0' }.count
  y = N.times.select { |i| SS[i][j] == '1' }.count

  if x == 0 || y == 0
    N.times { |i| ts[i] += 1 }
  elsif x < y
    N.times { |i| ts[i] += 1 if SS[i][j] == '0' }
  else
    N.times { |i| ts[i] += 1 if SS[i][j] == '1' }
  end
end

m = ts.max
rs = []
N.times { |i| rs << i + 1 if ts[i] == m }

puts rs.join(' ')




