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

H, W, Q = STDIN.gets.chomp.split.map(&:to_i)
RCXS = (1..Q).map do
  r, c, x = STDIN.gets.chomp.split
  [r.to_i, c.to_i, x]
end


rcxis = {}
RCXS.each.with_index do |(r, c, x), d|
  rcxis[r - 1] ||= {}
  rcxis[r - 1][c - 1] = [x, d] # 全く同じ場所は後のもので上書き
end

pp(rcxis:) if $debug

board = []
line = Array.new(W)
line_last = Array.new(W, ['A', -1])
(0...H).reverse_each do |i|
  pp(i:) if $debug
  line = []
  c = 'A'
  d = -1
  (0...W).reverse_each do |j|
    pp(j:) if $debug
    x0, d0 = rcxis.dig(i, j)
    pp(line_last:) if $debug
    c1, d1 = line_last[W - j - 1]
    pp(j:, x0:, d0:, c1:, d1:, c:, d:) if $debug
    if x0 && d1 < d0
      c1, d1 = x0, d0
    end
    if d < d1
      c, d = c1, d1
    end
    line << [c, d]
    pp(line:) if $debug
  end
  line_last = line.dup
  board << line_last
  pp(line:) if $debug
end

# pp(board:) if $debug

board.reverse.each do |line|
  puts line.reverse.map { |c, d| c }.join('')
end
