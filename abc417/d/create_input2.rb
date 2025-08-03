#!/usr/bin/env ruby


N = 10000
puts N
N.times do
  puts [rand(5) + 1, rand(5) + 1, rand(5) + 1].join(' ')
end

Q = 5 * 10 ** 5
puts N
Q.times do |i|
  puts i
end

