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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


ajjs = N.times.map do |j|
  AS[j] * (j ** 2)
end
sajjs = []
sajjs[0] = ajjs[0]
(1...N).each do |j|
  sajjs[j] = sajjs[j - 1] + ajjs[j]
end

ajs = N.times.map do |j|
  AS[j] * j
end
sajs = []
sajs[0] = ajs[0]
(1...N).each do |j|
  sajs[j] = sajs[j - 1] + ajs[j]
end

sas = []
sas[0] = AS[0]
(1...N).each do |j|
  sas[j] = sas[j - 1] + AS[j]
end

def calc(li, ri, sajjs, sajs, sas)
  if 0 < li
    # (li..ri).map do |j|
    #   AS[j] * (- j ** 2 + (ri + li) * j + (-li + 1) * (ri + 1))
    # end.sum
    - (sajjs[ri] - sajjs[li - 1]) + (ri + li) * (sajs[ri] - sajs[li - 1]) + (-li + 1) * (ri + 1) * (sas[ri] - sas[li - 1])
  else
    - sajjs[ri] + (ri + li) * sajs[ri] + (-li + 1) * (ri + 1) * sas[ri]
  end
end

LRS.each do |li, ri|
  puts calc(li - 1, ri - 1, sajjs, sajs, sas)
end
