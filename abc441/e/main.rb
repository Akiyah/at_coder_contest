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
S = STDIN.gets.chomp

def calc()

  ss = S.chars
  ns = ss.map { |x| x == 'A' ? 1 : (x == 'B' ? -1 : 0) }
  hs = [0]
  h = 0
  ns.each do |n|
    h += n
    hs << h
  end
  pp(ss:) if $debug
  pp(ns:) if $debug
  pp(hs:) if $debug

  h_hash = hs.tally
  pp(h_hash:) if $debug

  s = h_hash.map { |h2, c2| 0 < h2 ? c2 : 0 }.sum
  pp(s:) if $debug

  r = 0
  N.times do |i|
    n = ns[i]
    h = hs[i]
    h_hash[h] -= 1
    r += s
    if n == 0
    elsif n == 1
      s -= h_hash[h + 1]
    else # n == -1
      s += h_hash[h]
    end
    # r0 = h_hash.map { |h2, c2| h < h2 ? c2 : 0 }.sum
    pp(n:, h:, s:, r:, h_hash:) if $debug
  end

  r
end


puts calc()



# ACBBCABCAB
# A
# AC
#     CA
#      A
#      ABCA
#     CABCA
#        CA
#         A

#    0  2
# A  1
# C  1  
# B  0  
# B -1  2  
# C -1  2
# A  0
# B -1  1  
# C -1  1
# A  0
# B -1


