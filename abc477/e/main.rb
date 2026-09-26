#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

QUERIES = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


paths = {}
AS.each.with_index do |a, i|
  j = (i + 1) % N
  paths[i] ||= {}
  paths[i][j] = a
  paths[j] ||= {}
  paths[j][i] = a
end
paths[N] ||= {}
BS.each.with_index do |b, i|
  paths[i][N] = b
  paths[N][i] = b
end

length_from_N = {}
pq = AcLibraryRb::PriorityQueue.new {|(i0, l0), (i1, l1)| l0 < l1 }
pq << [N, 0]
# length_from_N[N] = 0
while !pq.empty?
  i, l = pq.pop
  next if length_from_N[i]

  length_from_N[i] = l
  paths[i].each do |j, j_v|
    unless length_from_N[j]
      pq << [j, l + j_v]
    end
  end
end

pp(length_from_N:) if $debug



ls = [] # 1からの円周を通っての長さ
l = 0
ls << l
AS.each do |a|
  l += a
  ls << l
end

QUERIES.each do |s1, t1|
  s = s1 - 1
  t = t1 - 1
  s, t = t, s unless s < t

  if t == N
    puts length_from_N[s]
    next
  end

  l0 = length_from_N[s] + length_from_N[t]

  l1 = ls[t] - ls[s]
  l2 = ls[-1] - (ls[t] - ls[s])


  puts [l0, l1, l2].min
end

