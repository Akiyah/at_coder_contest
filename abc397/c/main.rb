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

cs = AS.group_by{|i|i}.transform_values(&:count)
ds = Hash.new(0)
rc = cs.keys.count

a0 = AS[0]
ds[a0] = 1
rd = 1
if cs[a0] == 1
  rc -= 1
end
cs[a0] -= 1

r = rc + rd

rs = (1...N).map do |i|
  a = AS[i]
  if ds[a] == 0
    rd += 1
  end
  ds[a] += 1

  if cs[a] == 1
    rc -= 1
  end
  cs[a] -= 1
  
  rc + rd
end


puts (rs + [r]).max
