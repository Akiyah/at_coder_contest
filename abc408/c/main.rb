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

N, M = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc 
  ls = LRS.map { |l, r| [l - 1, 0] }
  rs = LRS.map { |l, r| [r, 1] }
  lrs = (ls + rs).sort

  pp(ls:, rs:, lrs:) if $debug

  return 0 if 0 < lrs[0][0]
  return 0 if lrs[-1][0] < N

  w = 0
  w_min = N
  last_lr = 1
  last_t = nil
  lrs.each do |lr, t|
    if last_lr < lr
      w_min = w if w < w_min
    end

    if t == 0
      w += 1
    else
      w -= 1
    end
    pp(lr:, t:, w:, w_min:) if $debug
    last_lr = lr
    last_t = t
  end
  w_min
end


puts calc
