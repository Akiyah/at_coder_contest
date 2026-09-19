#!/usr/bin/env ruby


N = 2 * 10 ** 5
M = 2 * 10 ** 5
is = (1..N).to_a
PS = is.shuffle
LRS = (1..M).map do
  l, r = is.sample(2).sort
  [l, r]
end

puts [N, M].join(' ')
puts PS.join(' ')
LRS.each do |l, r|
  puts [l, r].join(' ')
end


