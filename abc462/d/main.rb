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

N, D = STDIN.gets.chomp.split.map(&:to_i)
STS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
pp(STS:) if $debug

r = 0
ios = []
STS.each.with_index do |(s, t), i|
  if D <= t - s
    ios << [s + D, i, true]
    ios << [t, i, false]
  end
end

pp(ios:) if $debug

ios2 = ios.sort_by { |t, i, enter| t }

pp(ios2:) if $debug

is = Hash.new(0)
os = Hash.new(0)
ts = {}
ios2.each do |t, i, enter|
  if enter
    is[t] += 1
  else
    os[t] += 1
  end
  ts[t] = true
end

ks = ts.keys.sort

pp(is:, os:, ts:, ks:) if $debug

h_count = 0
r = 0
last_t = ks[0]
ts.keys.sort.each do |t|
  pp(t:, last_t:) if $debug

  r += h_count * (h_count - 1) / 2 * (t - last_t - 1) # 手前まで
  pp(h_count:, dt: t - last_t, r:) if $debug

  h_count += is[t]

  r += h_count * (h_count - 1) / 2 # t の瞬間
  pp(h_count:, dt: 1, r:) if $debug

  h_count -= os[t]

  last_t = t
end

puts r

