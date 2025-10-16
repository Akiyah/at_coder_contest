#!/usr/bin/env ruby



T = 1 # 10 ** 2
N = 10 ** 5
K = 10 ** 9

puts T

T.times do
  x = rand(N + K) + 1
  puts [N, K, x].join(' ')

  as = N.times.map { rand(10 ** 9) + 1 }
  puts as.join(' ')
end
