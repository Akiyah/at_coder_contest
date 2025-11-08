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
WHBS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  wb0 = 0
  cb0 = 0
  whbs = []
  w_sum = 0
  WHBS.each do |w, h, b|
    w_sum += w
    if h <= b
      wb0 += w
      cb0 += b
    else
      whbs << [w, h, b]
    end
  end
  pp(wb0:, cb0:, whbs:, w_sum:) if $debug

  dp = []
  w, h, b = whbs[0]
  dp << [cb0 + h, w, wb0, 0] # h [c, wh, wb, i]
  dp << [cb0 + b, 0, wb0 + w, 0] # b
  pp(dp:) if $debug

  l = whbs.length
  c_max = 0
  while 0 < dp.length
    c, wh, wb, i = dp.shift
    if l == i + 1
      if wh <= wb
        c_max = c if c_max < c
      end
      next
    end
    wi, hi, bi = whbs[i + 1]

    if w_sum < (wh + wi) * 2
      # dp << [c + hi, wh + wi, wb, i + 1]  # h [c, wh, wb, i]
      dp << [c + bi, wh, wb + wi, i + 1] # b
    else
      if w_sum < (wb + wi) * 2
        dp << [c + hi, wh + wi, wb, i + 1]  # h [c, wh, wb, i]
        # dp << [c + bi, wh, wb + wi, i + 1] # b
      else
        dp << [c + hi, wh + wi, wb, i + 1]  # h [c, wh, wb, i]
        dp << [c + bi, wh, wb + wi, i + 1] # b
      end
    end
    pp(dp:) if $debug
  end

  c_max
end


puts calc
