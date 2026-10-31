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

# N = STDIN.gets.chomp.to_i
H, W, N, Q = STDIN.gets.chomp.split.map(&:to_i)
RCS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
QUERIES = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
pp(H:, W:, N:, Q:) if $debug
pp(RCS:) if $debug
pp(QUERIES:) if $debug


rs = []
r_counts = {}
r_count_sums = {}
cs = []
c_counts = {}
c_count_sums = {}

RCS.each do |r, c|
  rs << r
  cs << c
  r_counts[r] ||= 0
  r_counts[r] += 1
  c_counts[c] ||= 0
  c_counts[c] += 1
end
pp(rs:) if $debug
pp(cs:) if $debug
pp(r_counts:) if $debug
pp(c_counts:) if $debug

QUERIES.each do |t, a, b|
  if t == 1
    rs << a
    rs << b
  else
    cs << a
    cs << b
  end
end
pp(rs:) if $debug
pp(cs:) if $debug

rs = rs.uniq.sort
cs = cs.uniq.sort
pp(rs:) if $debug
pp(cs:) if $debug


r_count_sum = 0
rs.each do |r|
  r_count_sum += r_counts[r] || 0
  r_count_sums[r] = r_count_sum
end
pp(r_count_sums:) if $debug

c_count_sum = 0
cs.each do |c|
  c_count_sum += c_counts[c] || 0
  c_count_sums[c] = c_count_sum
end
pp(c_count_sums:) if $debug

QUERIES.each do |t, a, b|
  if t == 1
    ans = r_count_sums[b] - r_count_sums[a] + (r_counts[a] || 0)
  else
    ans = c_count_sums[b] - c_count_sums[a] + (c_counts[a] || 0)
  end
  puts ans
end




