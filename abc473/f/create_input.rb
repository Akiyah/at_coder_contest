#!/usr/bin/env ruby

N = 5 * 10 ** 4
S = N.times.map { ['A', 'A', 'A', 'A', 'B'].sample }.join('')
Q = 2 * 10 ** 4

puts N
puts S
puts Q


Q.times do
  t = rand(1..2)
  if t == 1
    i = rand(1..N)
    c = ['A', 'B'].sample
    puts [t, i, c].join(' ')
  else
    l = rand(1..N)
    r = rand(1..N)
    l, r = r, l if r < l
    puts [t, l, r].join(' ')
  end
end

