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

N, X = STDIN.gets.chomp.split.map(&:to_i)
UDS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp({N:, X:, UDS:}) if $debug


def check(h)
  x_min = 0
  x_max = h
  UDS.each do |u, d|
    x_min = [0, x_min - X, h - d].max
    x_max = [h, x_max + X, u].min
    return false if x_max < x_min
  end

  true
end


def calc
  ud_min = UDS.map { |u, d| u + d }.min
  pp ud_min.class if $debug

  ud_sum = UDS.map { |u, d| u + d }.sum
  pp ud_sum.class if $debug



  h = (1..ud_min).bsearch do |h|
    !check(h)
  end

  h ||= ud_min + 1
  return ud_sum - N * (h - 1)
end

puts calc
