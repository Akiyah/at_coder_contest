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

H, W, K = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.chars.map(&:to_i)
end

def calc
  ans = 0
  (0...H).each do |r1|
    bs = nil
    (r1...H).each do |r2|
      if r2 == r1
        bs = SS[r1]
      else
        bs = bs.zip(SS[r2]).map { |a, b| a + b }
      end

      b0_sum = 0
      b1_sum = 0
      c0 = 0
      c1 = 0
      W.times do |c|
        b = bs[c]
        b0_sum += b
        b1_sum += b
        while c0 <= c && K < b0_sum
          b0_sum -= bs[c0]
          c0 += 1
        end
        while c1 <= c && K <= b1_sum
          b1_sum -= bs[c1]
          c1 += 1
        end
        if b0_sum == K
          ans += c1 - c0
        else
        end
        pp(c0:, c1:, b:, b0_sum:, b1_sum:, bs:, ans:) if $debug
      end
      pp(r1:, r2:, ans:) if $debug
      
    end
  end

  ans
end

puts calc

