#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


dsu = AcLibraryRb::DSU.new(N)

removables = {}
ABS.each_with_index do |ab, i|
  a, b = ab
  if dsu.same?(a - 1, b - 1)
    l = dsu.leader(a - 1)
    removables[l] ||= []
    removables[l] << [i, a - 1, b - 1]
  else
    dsu.merge(a - 1, b - 1)
  end
end


pp dsu.groups if $debug
pp removables if $debug

groups = dsu.groups

if groups.length == 1
  puts 0
  exit
end


gls = groups.map do |group|
  a = group[0]
  l = dsu.leader(a)
  [group, removables[l] || []]
end

pp gls if $debug

gls = gls.sort_by { |group, removables| removables ? removables.length : 0 }

removables3 = []
gls.reverse.each do |group, removables|
  removables3 += (removables || [])
end

rs = []
gls[0...-1].each do |group, removables|
  removable = removables3.shift
  i, a_, b_ = removable
  # a = group[0]
  rs << [i + 1, a_ + 1, group[0] + 1]
end

pp rs if $debug


puts rs.length
rs.each do |r|
  puts r.join(' ')
end
