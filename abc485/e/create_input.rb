#!/usr/bin/env ruby

N = 2 * 10 ** 5
M = 2 * 10 ** 5 - 1

puts [N, M].join(' ')

# M.times do |i|
#   puts [i + 1, i + 2, i + 1].join(' ')
# end


(2..M).each do |i|
  puts [1, i, i].join(' ')
end

puts [M, N, N].join(' ')

