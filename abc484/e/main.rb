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

N, L, R = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
pp(N:, L:, R:) if $debug
pp(AS:) if $debug




def calc(ss, r, l) # vより小さくなる数
  pp(ss:, r:, l:) if $debug
  ans = 0
  ss2 = [0]
  N.times do |j|
    s_j = ss[j + 1]
    pp(j:, s_j:) if $debug

    i_r = ss2.bsearch_index { |s| s < s_j - r } || j + 1
    ans += i_r
    i_l = ss2.bsearch_index { |s| s < s_j - (l - 1) } || j + 1
    ans -= i_l
    pp(i_r:, i_l:, ans:, ss2:) if $debug

    i2 = ss2.bsearch_index { |s| s < s_j } || j + 1
    ss2.insert(i2, s_j)
    pp(i2:, ss2:) if $debug
  end
  ans
end


s = 0
ss = []
ss << s
AS.each do |a|
  s += a
  ss << s
end
pp(ss:) if $debug

r = calc(ss, R, L)
pp(r:) if $debug

puts r