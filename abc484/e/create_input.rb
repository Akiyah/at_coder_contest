#!/usr/bin/env ruby



# N = 3 * 10 ** 5
N = 3 * 10 ** 3
L = 100
R = 200

AS = N.times.map { rand((-10 ** 12)..(10 ** 12))  }


puts [N, L, R].join(' ')
puts AS.join(' ')

