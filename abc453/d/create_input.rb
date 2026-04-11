#!/usr/bin/env ruby

H = 1000
W = 1000

puts [H, W].join(' ')

puts 'S' + '.' * 999
998.times do
  puts '.' * 1000
end
puts '.' * 999 + 'G'
