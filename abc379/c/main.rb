#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, M = STDIN.gets.chomp.split.map(&:to_i)
XS = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

h = Hash.new(0)
M.times do |m|
  h[XS[m]] = AS[m]
end

def calc(h)
  last = N
  c = 0
  XS.sort.reverse.each do |x|
    return -1 if last - x + 1 < h[x]

    # d = last - x + 1


    pp [last, x, h[x], last - h[x] + 1 - x, h[x] * (h[x] - 1) / 2, (last - h[x] + 1 - x) * h[x] + h[x] * (h[x] - 1) / 2] if $debug

    c += (last - h[x] + 1 - x) * h[x] + h[x] * (h[x] - 1) / 2

    # pp [d, h[x], d - h[x], c, last] if $debug
    # pp [d * (d - 1) / 2, (d - h[x]) * (d - h[x] + 1) / 2, d * (d - 1) / 2 - (d - h[x]) * (d - h[x] + 1) / 2] if $debug
    # c += d * (d + 1) / 2 - (d - h[x]) * (d - h[x] + 1) / 2
    last = last - h[x]
  end

  return -1 if last != 0

  c
end


puts calc(h)
