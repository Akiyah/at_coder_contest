#!/usr/bin/env ruby

N = 500
M = 500
L = 50
AS = N.times.map { rand(M) }

puts [N, M, L].join(' ')
puts AS.join(' ')
