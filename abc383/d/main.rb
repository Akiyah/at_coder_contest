#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


N = STDIN.gets.chomp.to_i


require 'prime'

def calc
  r = 0
  # p ** 9 <= N
  Prime.each(N) do |prime|
    break if N < prime ** 8
    r += 1 
  end

  # (p ** 2) * (q ** 2) <= N
  ps = []
  Prime.each(N) do |prime|
    break if N < prime ** 2
    ps << prime
  end

  r2 = 0
  ps.each.with_index do |p, i|
    ps[(i + 1)..].each do |q|
      break if N < (p ** 2) * (q ** 2) 
      r2 += 1
    end
  end

  pp [r, r2] if $debug
  r + r2
end


puts calc

