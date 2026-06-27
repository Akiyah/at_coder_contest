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


board = Array.new(H) { Array.new(W, 'A') }
RCXS.each do |r, c, x|
  (0...r).each do |i|
    (0...c).each do |j|
      board[i][j] = x
    end
  end    
end

H.times do |i|
  puts board[i].join('')
end
