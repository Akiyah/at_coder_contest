#!/usr/bin/env ruby

H = 1000
W = 1000

puts [H, W].join(' ')

puts 'S' + '#' * (W - 1)
puts 'x' + 'o' * (W - 2) + 'x'
(H / 2 - 2).times do
  puts '.' + '#' * (W - 1)
  puts 'x' + 'o' * (W - 2) + 'x'
end
puts '.' + '#' * (W - 1)
puts 'x' + 'o' * (W - 2) + 'G'
