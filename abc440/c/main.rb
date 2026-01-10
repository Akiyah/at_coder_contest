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

T = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def calc(n, w, cs)
  pp(n:, w:, cs:) if $debug
  ds = Array.new(2 * w, 0)
  cs.each.with_index do |c, i|
    ds[i % (2 * w)] += c
  end
  pp(ds:) if $debug

  # 0
  m = w.times.map { |i| ds[i] }.sum
  m_min = m
  pp(m:) if $debug

  (1...(2 * w)).each do |i|
    m -= ds[(i - 1) % (2 * w)]
    m += ds[(w - 1 + i) % (2 * w)]
    pp(m:) if $debug
    m_min = m if m < m_min
  end
  m_min
end


T.times do
  n, w = STDIN.gets.chomp.split.map(&:to_i)
  cs = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, w, cs)
end




