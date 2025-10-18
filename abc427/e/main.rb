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

H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp
end

pp(H:, W:) if $debug
pp(SS:) if $debug

BOARD = (1 << (H * W)) - 1
BOARD_LEFT = BOARD - H.times.map { |i| 1 << (i * W + 0) }.sum
BOARD_RIGHT = BOARD - H.times.map { |i| 1 << (i * W + (W - 1)) }.sum

pp(BOARD: BOARD.to_s(2)) if $debug
pp(BOARD_LEFT: BOARD_LEFT.to_s(2)) if $debug
pp(BOARD_RIGHT: BOARD_RIGHT.to_s(2)) if $debug

def to_s2(z, t0)
  H.times.map do |i|
    W.times.map do |j|
      if t0[i * W + j] == 1
        'T'
      elsif z[i * W + j] == 1
        '#'
      else
        '.'
      end
    end.join('')
  end.join("\n")
end

def calc_one(z, t0, calced_zs)
  z2s = []

  # up
  z2 = (z << W) & BOARD
  z2s << z2 if z2 & t0 == 0 && !calced_zs[z2]

  # down
  z2 = (z >> W) & BOARD
  z2s << z2 if z2 & t0 == 0 && !calced_zs[z2]

  # left
  z2 = (z << 1) & BOARD_LEFT
  z2s << z2 if z2 & t0 == 0 && !calced_zs[z2]

  # right
  z2 = (z >> 1) & BOARD_RIGHT
  z2s << z2 if z2 & t0 == 0 && !calced_zs[z2]

  z2s
end

def calc
  z0 = 0
  t0 = nil
  SS.each.with_index do |s, i|
    s.chars.each_with_index do |c, j|
      if c == 'T'
        t0 = 1 << (i * W + j)
      end
      if c == '#'
        z0 += 1 << (i * W + j)
      end
    end
  end

  dp = []
  dp << [z0, 0]
  calced_zs = {}
  calced_zs[z0] = true
  while 0 < dp.length
    z, n = dp.shift
    pp(z: z.to_s(2), n:) if $debug
    puts(to_s2(z, t0)) if $debug
    z2s = calc_one(z, t0, calced_zs)

    z2s.each do |z2|
      return n + 1 if z2 == 0
      dp << [z2, n + 1]
      calced_zs[z2] = true
    end
  end

  -1
end

puts calc
