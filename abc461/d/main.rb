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

  board_areas = []
  H.times do |r|
    (0...W).each do |c1|
      board_areas[c1] ||= []
      (c1...W).each do |c2|
        board_areas[c1][c2] ||= []
        if c1 == c2
          board_areas[c1][c2][r] = SS[r][c1]
        else
          board_areas[c1][c2][r] = board_areas[c1][c2 - 1][r] + SS[r][c2]
        end
      end
    end
  end

  pp(board_areas:) if $debug

  ans = 0
  (0...W).each do |c1|
    x1 = board_areas[c1]
    (c1...W).each do |c2|
      x2 = x1[c2]
      pp(c1:, c2:) if $debug
      bs = []
      b0_sum = 0
      b1_sum = 0
      r0 = 0
      r1 = 0
      H.times do |r|
        b = x2[r]
        bs << b
        b0_sum += b
        b1_sum += b
        # ans += 1 if b_sum == K
        # pp(b:, b_sum:, bs:, ans:) if $debug
        while r0 <= r && K < b0_sum
          b0_sum -= bs[r0]
          r0 += 1
        end
        while r1 <= r && K <= b1_sum
          b1_sum -= bs[r1]
          r1 += 1
        end
        if b0_sum == K
          ans += r1 - r0
        else
        end
        pp(r0:, r1:, b:, b0_sum:, b1_sum:, bs:, ans:) if $debug
      end
      pp(c1:, c2:, ans:) if $debug
      
    end
  end



  ans
end

puts calc

