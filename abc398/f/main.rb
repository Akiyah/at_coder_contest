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

def calc
  ss = S.chars.join('*').chars
  n = ss.length
  rs = Array.new(n) { 0 }
  j = 0
  (0...n).each do |i|
    if i < j + rs[j]
      rs[i] = [rs[j - (i - j)], j + rs[j] - i].min
    end

    if j + rs[j] <= i + rs[i]
      while 0 <= i - rs[i] && i + rs[i] < n && ss[i - rs[i]] == ss[i + rs[i]]
        rs[i] += 1
      end
      j = i
    end
  end

  pp ss if $debug
  pp rs if $debug

  r_max = 0
  rs.each.with_index do |r, i|
    r_max = [r, r_max].max if r + i == n
  end
  
  S + S[0...-r_max].reverse
end

puts calc
