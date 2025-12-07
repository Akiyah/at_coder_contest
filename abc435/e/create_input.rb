#!/usr/bin/env ruby

N = 10 ** 9
Q = 2 * 10 ** 5



puts [N, Q].join(' ')
Q.times do |i|
  # l = rand(N) + 1
  # r = rand(N) + 1
  # l, r = r, l unless l < r

  l = i * 3 + 2
  r = l + 1

  puts [l, r].join(' ')
end



