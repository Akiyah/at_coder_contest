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
S = STDIN.gets.chomp
T = STDIN.gets.chomp
LRS = Q.times.map { STDIN.gets.chomp.split.map(&:to_i) }


ss = S.split(T)

js = []
j = 0
l_t = T.length
ss.each.with_index do |s, i|
  j += s.length
  js << j
  j += l_t
end

pp(js:) if $debug

lris = LRS.map.with_index { |(l, r), i| [l, r, i] }.sort_by { |l, r, i| [l, r, i] }

pp(lris:) if $debug

k = 0
lris.each do |l, r, i|
  if js[k] 
end


