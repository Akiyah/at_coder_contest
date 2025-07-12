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

A = STDIN.gets.chomp.to_i
N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

def calc_one(k, k_max)
  r = 0
  if k == 1
    (0..9).each do |y|
      return r if N < y
      s = y.to_s(A)
      if s == s.reverse
        pp(k:, y:, s:) if $debug
        r += y
      end
    end
  elsif k % 2 == 0
    k2 = (k / 2)
    ((10 ** (k2 - 1))...(10 ** k2)).each do |x2|
      x = (x2.to_s + x2.to_s.reverse).to_i
      return r if N < x
      s = x.to_s(A)
      if s == s.reverse
        pp(k:, x2:, x:, s:) if $debug
        r += x
      end
    end
  else
    k2 = (k / 2)
    ((10 ** (k2 - 1))...(10 ** k2)).each do |x2|
      (0..9).each do |y|
        x = (x2.to_s + y.to_s + x2.to_s.reverse).to_i
        return r if N < x
        s = x.to_s(A)
        if s == s.reverse
          pp(k:, x2:, y:, x:, s:) if $debug
          r += x
        end
      end
    end
  end
  r
end


def calc
  k_max = N.to_s.length

  r = 0
  (1..k_max).each do |k|
    r += calc_one(k, k_max)
    pp(k:, r:) if $debug
  end

  r
end


puts calc()
