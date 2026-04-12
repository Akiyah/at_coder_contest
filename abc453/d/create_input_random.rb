#!/usr/bin/env ruby

H = 1000
W = 1000

puts [H, W].join(' ')

board = Array.new(H) { Array.new(W) { ['#', '.', 'o', 'x'].sample } }

s = [rand(H), rand(W)]
g = [rand(H), rand(W)]
while s == g
  g = [rand(H), rand(W)]
end

board[s[0]][s[1]] = 'S'
board[g[0]][g[1]] = 'G'

board.each do |line|
  puts line.join('')
end
