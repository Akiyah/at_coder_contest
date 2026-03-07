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

MOD = 10007

K, M = STDIN.gets.chomp.split.map(&:to_i)
CLS = (1..K).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

s = ''
CLS.each do |c, l|
  s += c.to_s * l
end

pp(s:) if $debug
n = s.to_i

puts (n / M) % MOD

