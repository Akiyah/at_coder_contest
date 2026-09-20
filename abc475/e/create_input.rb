#!/usr/bin/env ruby


N = 3 * 10 ** 4
M = 3 * 10 ** 4 / 2
K = 200

T = K.times.map { [:o, :x].sample }.join()
SS = N.times.map { K.times.map { [:o, :x].sample }.join() }

Q = 5 * 10 ** 4

IJS = Q.times.map { [rand(N) + 1, rand(K) + 1] }


puts [N, M, K].join(' ')
puts T
SS.each do |s|
  puts s
end

puts Q
IJS.each do |i, j|
  puts [i, j].join(' ')
end

