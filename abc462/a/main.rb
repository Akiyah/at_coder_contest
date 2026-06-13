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

S = STDIN.gets.chomp
pp(S:) if $debug

r = []
S.chars.each do |s|
  pp(s:) if $debug
  r << s if ['1','2','3','4','5','6','7','8','9','0'].include?(s)
  pp(r:) if $debug
end

if 0 < r.length
  puts r.join('')
else
end