#!/usr/bin/env ruby

H = 500
W = 500

puts [H, W].join(' ')

puts 'S' + '.' * (W - 1)
(H - 2).times do
  puts '.' * W
end
puts '.' * (W - 1) + 'G'
