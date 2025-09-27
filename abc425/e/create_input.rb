#!/usr/bin/env ruby

T = 3 * (10 ** 5) / 500
M = 10 ** 9 - 1

puts [T, M].join(' ')

T.times do
  n = 500
  cs = n.times.map { rand(10) + 1 }

  puts n
  puts cs.join(' ')
end
