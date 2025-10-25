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

N, M, C = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

h = {}
AS.each do |a|
  h[a] ||= 0
  h[a] += 1
end

ss = []
gs = []
last_k = 0
h.keys.sort.each do |k|
  ss << k - last_k
  gs << h[k]
  last_k = k
end

pp(h:, ss:, gs:) if $debug

ss[0] += M - last_k

pp(h:, ss:, gs:) if $debug

# x0
def calc(ss, gs)
  r = 0
  l = ss.length
  i = 0
  j = 0
  g_sum = gs[j]
  while i < l
    if g_sum < C # gをずらす
      j = (j + 1) % l
      g_sum += gs[j]
    else
      r += ss[i] * g_sum
      g_sum -= gs[i]
      i = i + 1
    end
  end

  r
end


puts calc(ss, gs)
