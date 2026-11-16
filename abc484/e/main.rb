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




def calc(ss, v) # vより小さくなる数
  pp(ss:, v:) if $debug
  r = 0
  ss2 = [0]
  N.times do |j|
    s_j = ss[j + 1]
    pp(j:, s_j:) if $debug

    i1 = ss2.bsearch_index { |s| s < s_j - v } || j + 1
    r += i1
    pp(i1:, r:, ss2:) if $debug

    i2 = ss2.bsearch_index { |s| s < s_j } || j + 1
    ss2.insert(i2, s_j)
    pp(i2:, ss2:) if $debug

    # (0..j).each do |i|
    #   s = ss[j + 1] - ss[i]
    #   pp(i:, j:, s:) if $debug
    #   r += 1 if s <= v
    # end
  end
  r
end


s = 0
ss = []
ss << s
AS.each do |a|
  s += a
  ss << s
end
pp(ss:) if $debug

r1 = calc(ss, R)
r2 = calc(ss, L - 1)
r = r1 - r2
pp(r1:, r2:, r:) if $debug

puts r