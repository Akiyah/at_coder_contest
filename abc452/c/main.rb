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
ABS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
M = STDIN.gets.chomp.to_i
SS = (1..M).map do
  STDIN.gets.chomp
end

data = Array.new(11) { {} }
SS.each do |s|
  cs = s.chars
  l = cs.length
  cs.each.with_index do |c, i|
    data[l][i] ||= {}
    data[l][i][c] = true
  end
end


pp(data:) if $debug


SS.each do |s|
  cs = s.chars
  l = cs.length

  if l != N
    puts 'No'
    next
  end

  r = true
  ABS.each.with_index do |(a, b), i|
    c = cs[i]
    pp(a:, b:, i:, c:) if $debug
    r = false if !data[a][b - 1][c]
    pp(a:, b:, i:, c:, r: data[a][b - 1][c]) if $debug
  end
  
  puts r ? 'Yes' : 'No'
end


