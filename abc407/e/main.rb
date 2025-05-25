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


def calc(n, as)
  a0 = as[0]
  dp_up = [a0]
  dp_down = []

  (1...(n * 2)).each do |k|
    pp(dp_up:, dp_down:, a: as[k]) if $debug
    dp_up_new = []
    dp_down_new = []
    dp_up.each_with_index do |v, i|
      if v
        if i + 1 <= n * 2 - k
          dp_up_new[i + 1] = v + as[k]
        end
        dp_down_new[i] = v
      end
    end
    dp_down.each_with_index do |v, i|
      if v
        dp_up_new[i] = v + as[k] if !dp_up_new[i] || dp_up_new[i] < v + as[k]
        if 0 <= i - 1
          dp_down_new[i - 1] = v if !dp_down_new[i - 1] || dp_down_new[i - 1] < v
        end
      end
    end

    dp_up = dp_up_new
    dp_down = dp_down_new
  end

  pp(dp_up:, dp_down:) if $debug

  dp_down[0]
end


T.times do
  n = STDIN.gets.chomp.to_i
  as = (1..(2 * n)).map do
    STDIN.gets.chomp.to_i
  end
  puts calc(n, as)
end


