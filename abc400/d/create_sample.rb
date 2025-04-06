#!/usr/bin/env ruby

H, W = 1000, 1000
A, B, C, D = 1, 1, 1000, 1000

puts [H, W].join(' ')
(1..H).each do
  line = (1..W).map do
    rand < 0.5 ? '#' : '.'
    '.'
  end.join('')
  puts line
end
puts [A, B, C, D].join(' ')

