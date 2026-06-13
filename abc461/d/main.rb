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
  ss = []
  ss << Array.new(W + 1, 0)
  SS.each.with_index do |line, i|
    ss[i + 1] = []
    ss[i + 1][0] = 0
    sum = 0
    line.each.with_index do |b, j|
      sum += b
      ss[i + 1][j + 1] = sum + ss[i][j + 1]
    end
  end
  pp(ss:) if $debug

  ans = 0
  (0...H).each do |r1|
    ssr1 = ss[r1]
    bs = Array.new(W, 0)
    ((r1 + 1)..H).each do |r2|
      ssr2 = ss[r2]
      x = Hash.new(0)
      (0..W).each do |c|
        b = ssr2[c] - ssr1[c]
        ans += x[b - K]
        x[b] += 1
        pp(x:, ans:) if $debug
      end
      pp(r1:, r2:, ans:) if $debug      
    end
  end

  ans
end

puts calc

