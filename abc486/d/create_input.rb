#!/usr/bin/env ruby

N = 6000
LPS = (1..N).map do |i|
  [i, i]
end

puts N
LPS.each do |l, p|
  puts [l, p].join(' ')
end
