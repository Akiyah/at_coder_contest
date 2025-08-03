#!/usr/bin/env ruby


N = 10000
puts N
N.times do
  puts [rand(500) + 1, rand(500) + 1, rand(500) + 1].join(' ')
end

Q = 5 * 10 ** 5
puts N
Q.times do
  puts rand(10 ** 9 + 1)
end

