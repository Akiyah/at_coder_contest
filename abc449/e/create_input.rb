#!/usr/bin/env ruby

N = 5 * 10 ** 5
M = 5 * 10 ** 5
# AS = N.times.map { rand(1..M) }
AS = (10 ** 3).times.map { |i| [i + 1] * (i + 1) }.flatten[0...N]
Q = 2 * 10 ** 5
XS = Q.times.map { rand(1..(10 ** 18)) }

puts [N, M].join(' ')
puts AS.join(' ')
puts Q
XS.each do |x|
  puts x
end
