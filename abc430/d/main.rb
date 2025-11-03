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
XS = STDIN.gets.chomp.split.map(&:to_i)

INF = 10 ** 10

i2x = XS

x2i = i2x.map.with_index { |x, i| [x, i] }.to_h
pp(i2x:, x2i:) if $debug

j2x = XS.sort

x2j = j2x.map.with_index { |x, j| [x, j] }.to_h
pp(j2x:, x2j:) if $debug


x2v = {}
N.times do |j|
  x = j2x[j]
  i = x2i[x]

  j0 = ((j == 0) ? nil : j - 1)
  j1 = ((j + 1 < N) ? j + 1 : nil)

  x0 = (j0 ? j2x[j0] : 0)
  x1 = (j1 ? j2x[j1] : INF)

  x2v[x] = { i:, j:, x0:, x1: }
end

pp(x2v:) if $debug



sum = j2x[0] # 0から一個目までの距離
x2v.each do |x, v|
  sum += [x - v[:x0], v[:x1] - x].min  
end

pp(sum:) if $debug


rs = []
rs << sum
(1...N).to_a.reverse.each do |i|
  x = i2x[i]
  v = x2v[x]
  pp(i:, x:, v:) if $debug

  x0 = v[:x0]
  x1 = v[:x1]


  if x0 == 0
    v1 = x2v[x1]

    sum -= x
    sum -= [x  - v[:x0],  v[:x1]  - x ].min
    sum -= [x1 - v1[:x0], v1[:x1] - x1].min

    v1[:x0] = 0

    sum += x1
    sum += [x1 - v1[:x0], v1[:x1] - x1].min
  elsif x1 == INF
    v0 = x2v[x0]

    sum -= [x0 - v0[:x0], v0[:x1] - x0].min
    sum -= x - v[:x0]

    v0[:x1] = INF

    sum += x0 - v0[:x0]
  else
    v0 = x2v[x0]
    v1 = x2v[x1]

    sum -= [x0 - v0[:x0], v0[:x1] - x0].min
    sum -= [x  - v[:x0],  v[:x1]  - x ].min
    sum -= [x1 - v1[:x0], v1[:x1] - x1].min

    v0[:x1] = x1
    v1[:x0] = x0

    sum += [x0 - v0[:x0], v0[:x1] - x0].min
    sum += [x1 - v1[:x0], v1[:x1] - x1].min
  end

  rs << sum
end



rs.reverse.each do |r|
  puts r
end


