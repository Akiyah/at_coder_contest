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
S = STDIN.gets.chomp


def calc()
  ss = S.chars

  r = 0
  ds = {}
  a = 0
  b = 0
  c = 0

  pp(a:, b:, c:, ds:) if $debug

  ss.each do |s|
    # [0, 0]にプラス1
    ds[0 + b - a] ||= {}
    ds[0 + b - a][0 + c - a] ||= 0
    ds[0 + b - a][0 + c - a] += 1
    pp(a:, b:, c:, ds:) if $debug

    if s == 'A'
      a += 1
    elsif s == 'B'
      b += 1
    else # s == 'C'
      c += 1
    end


    ds.each do |db, dcs|
      next if db == b - a
      dcs.each do |dc, v|
        next if dc == c - a
        next if dc - (c - a) == db - (b - a)
        r += v
      end
    end
  end

  pp(a:, b:, c:, ds:) if $debug
  r
end





puts calc()



