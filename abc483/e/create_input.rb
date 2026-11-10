#!/usr/bin/env ruby

# N = 2 * 10 ** 5
N = 2 * 10 ** 4
M = 6

puts [N, M].join(' ')


chars = ('a'..'z').to_a
N.times do
  puts M.times.map { chars.sample }.join('')
end
