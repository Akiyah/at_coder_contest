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

removable_iabs = []
ABS.each_with_index do |ab, i|
  a, b = ab
  if dsu.same?(a - 1, b - 1)
    removable_iabs << [i, a - 1, b - 1]
  else
    dsu.merge(a - 1, b - 1)
  end
end

removables1 = {}
removables2 = []
removable_iabs.each do |i, a, b|
  l = dsu.leader(a)
  if removables1[l]
    removables2 << [i, a, b, l]
  else
    removables1[l] = [i, a, b, l]
  end
end

pp({removables1:,removables2:}) if $debug

groups = dsu.groups
ls = groups.map { |group| dsu.leader(group[0]) }

if ls.length == 1
  puts 0
  exit
end

ls0 = []
ls1 = []
ls.each do |l|
  if removables1[l]
    ls1 << l
  else
    ls0 << l
  end
end

l_base = ls1.shift

removables2 << removables1[l_base]
removables1[l_base] = nil

rs = []
ls1.each do |l|
  i, a, b = removables1[l]
  rs << [i + 1, a + 1, l_base + 1]
end

ls0.each do |l0|
  i, a, b, l = removables2.pop
  rs << [i + 1, a + 1, l0 + 1]
end

puts rs.length
rs.each do |r|
  puts r.join(' ')
end
