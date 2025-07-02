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

def count(i, j, i0, j0, bss)
  bss[i][j] - bss[i0][j] - bss[i][j0] + bss[i0][j0]
end

def sum_ass(ass, h, w)
  bss = Array.new(h + 1) { Array.new(w + 1, 0) }

  (1..h).each do |i|
    (1..w).each do |j|
      bss[i][j] = bss[i - 1][j] + bss[i][j - 1] - bss[i - 1][j - 1] + ass[i - 1][j - 1]
    end
  end

  bss
end

def calc()
  h, w = STDIN.gets.chomp.split.map(&:to_i)
  sss = h.times.map do
    STDIN.gets.chomp.split('')
  end

  ass = sss.map do |ss|
    ss.map { |s| s == '#' ? 1 : -1 }
  end

  if w < h
    ass = ass.transpose
    h, w = w, h
  end

  bss = sum_ass(ass, h, w)
  pp(ass:, bss:) if $debug

  r = 0
  (0...h).each do |i0|
    bssi0 = bss[i0]
    ((i0 + 1)..h).each do |i|
      bssi = bss[i]
      cs = Hash.new(0)
      cs[0] = 1
      r0 = 0
      w.times do |j|
        # c = bss[i][j + 1] - bss[i0][j + 1] #  - bss[i][0] + bss[i0][0]
        c = bssi[j + 1] - bssi0[j + 1] #  - bss[i][0] + bss[i0][0]
        pp(j:, c:) if $debug
        r0 += cs[c]
        cs[c] += 1
      end

      r += r0
      pp(i0:, i:, cs:, r0:, r:) if $debug
    end
  end

  r
end


T.times do
  puts calc()
end
