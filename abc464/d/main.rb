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


def calc(n, ss, xs, ys)
  
  if ss[0] == 'S'
    d_s = 0
    d_r = -xs[0]
  else
    d_s = -xs[0]
    d_r = 0
  end
  pp(d_s:, d_r:) if $debug

  (1...n).each do |i|
    pp(i:, 'ss[i]' => ss[i]) if $debug
    if ss[i] == 'S'
      d_s_s = d_s
      d_s_r = d_s - xs[i]
      d_r_s = d_r + ys[i - 1]
      d_r_r = d_r - xs[i]
    else
      d_s_s = d_s - xs[i]
      d_s_r = d_s
      d_r_s = d_r - xs[i] + ys[i - 1]
      d_r_r = d_r
    end
    pp(d_s_s:, d_s_r:, d_r_s:, d_r_r:) if $debug
    d_s = [d_s_s, d_r_s].max
    d_r = [d_s_r, d_r_r].max
    pp(d_s:, d_r:) if $debug
  end


  [d_s, d_r].max
end

T.times do |t|
  n = STDIN.gets.chomp.to_i
  ss = STDIN.gets.chomp.chars
  xs = STDIN.gets.chomp.split.map(&:to_i)
  ys = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, ss, xs, ys)
end
