#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"
# require 'prime'


$debug = !ARGV[0].nil?

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

def calc
  m = AS.max
  ss = Array.new(m + 1, 0)
  AS.each do |a|
    ss[a] += 1
  end

  pp({ss:, m:}) if $debug

  ts = ss.dup
  ts[1] = N
  # ts = Array.new(m + 1, 0)
  (2..(m / 2)).each do |d|
    # ((d * 2)..m).step(d).each do |n|
    #   ts[d] += ss[n]
    # end
    n = d * 2
    while n <= m
      ts[d] += ss[n]
      n += d
    end
  end

  pp({ts:}) if $debug

  us = Array.new(m + 1, 1)
  (2..m).each do |d|
    next if ts[d] < K
    # (d..m).step(d).each do |n|
    #   us[n] = d if us[n] < d
    #   # us[n] = [d, us[n]].max
    # end
    n = d
    while n <= m
      us[n] = d
      n += d
    end
  end

  pp({us:}) if $debug

  AS.map do |a|
    us[a]
  end
end

ts = calc

ts.each do |i|
  puts i
end
