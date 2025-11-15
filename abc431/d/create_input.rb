#!/usr/bin/env ruby

N = 500
puts N

N.times do
  w = rand(1..500)
  h = rand(1..(10 ** 9))
  b = rand(1..(10 ** 9))

  puts [w, h, b].join(' ')
end
