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
WHBS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  wb0 = 0
  cb0 = 0
  whbs = []
  WHBS.each do |w, h, b|
    if h <= b
      wb0 += w
      cb0 += b
    else
      whbs << [w, h, b]
    end
  end


  pp(wb0:, cb0:, whbs:) if $debug

  l = whbs.length
  pp(l:) if $debug
  (2 ** l).times.map do |z|
    wh = 0
    wb = 0
    c = 0
    whbs.each.with_index do |(w, h, b), i|
      if z[i] == 1 # b
        wb += w
        c += b
      else # h
        wh += w
        c += h
      end
    end
    pp(z:, wh:, wb:, wb0:, c:, cb0:, check: wh <= wb0 + wb, r: wh <= wb0 + wb ? c + cb0 : -1) if $debug
    wh <= wb0 + wb ? c + cb0 : -1
  end.max
end


puts calc
