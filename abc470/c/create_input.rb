#!/usr/bin/env ruby

N = 5 * 10 ** 5
Q = 5 * 10 ** 5

puts [N, Q].join(' ')

Q.times do |q|
  t = rand(100)
  if 0 < t
    x = rand(100) + 1
    puts [1, x].join(' ')
  else
    puts 2
  end
end
