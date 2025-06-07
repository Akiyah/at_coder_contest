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

N, L = STDIN.gets.chomp.split.map(&:to_i)
DS = STDIN.gets.chomp.split.map(&:to_i)

L3 = L / 3

def calc
  return 0 if L % 3 != 0

  h = {}
  ds = [0]
  h[0] = [0]
  d = 0
  DS.each_with_index do |d1, i|
    d += d1
    d %= L    
    ds[i + 1] = d
    h[d] ||= []
    h[d] << i + 1
  end


  pp(ds:, h:) if $debug

  r = 0
  calced_ds = {}
  N.times do |i|

    d = ds[i]
    pp(i:, d:) if $debug
    next if L3 <= d
    next if calced_ds[d]


    d0 = d % L
    d1 = (d + L3) % L
    d2 = (d + L3 * 2) % L

    i0s = h[d0] || []
    i1s = h[d1] || []
    i2s = h[d2] || []

    calced_ds[d0] = true
    calced_ds[d1] = true
    calced_ds[d2] = true

    pp(i0s:,i1s:,i2s:,) if $debug

    r += i0s.length * i1s.length * i2s.length
    pp(r:) if $debug
  end

  r
end


puts calc

