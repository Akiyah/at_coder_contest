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




def calc(p_sum, as)
  a_sum = 0
  as.each.with_index do |a, i|
    a_sum += a
    if p_sum < a_sum
      return i
    end
  end
  n
end


def run
  n = STDIN.gets.chomp.to_i
  wps = (1..n).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end

  p_sum = wps.map { |w, p| p }.sum
  as = wps.map { |w, p| w + p }.sort
  puts calc(p_sum, as)
end



T.times do
  run()
end

