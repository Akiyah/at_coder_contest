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


def count(dh, dw, i, j, h, w, is)
  pp(dh:, dw:, i:, j:, h:, w:) if $debug
  r = is.dig(dh, dw, i, j)
  return r if r

  is[dh] ||= {}
  is[dh][dw] ||= []
  is[dh][dw][i] ||= []

  if 1 < dw
    is[dh][dw][i][j] = is[dh][dw - 1][i][j] + is[dh][1][i][j + dw - 1]
  else
    is[dh][dw][i][j] = is[dh - 1][dw][i][j] + is[1][dw][i + dh - 1][j]
  end

  is[dh][dw][i][j]
end

def calc()
  h, w = STDIN.gets.chomp.split.map(&:to_i)
  ss = h.times.map do
    STDIN.gets.chomp.split('')
  end

  is = {}
  is[1] = {}
  is[1][1] = ss.map do |line|
    line.map { |s| s == '#' ? 1 : -1 }
  end

  r = 0
  (1..h).each do |dh|
    (1..w).each do |dw|
      (0...(h - dh + 1)).each do |i|
        (0...(w - dw + 1)).each do |j|
          r0 = count(dh, dw, i, j, h, w, is)
          r += 1 if r0 == 0
        end
      end
    end
  end

  r
end


T.times do
  puts calc()
end
