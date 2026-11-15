#!/usr/bin/env ruby



# N = 3 * 10 ** 5
N = 3 * 10 ** 4
L = 1 * 10 ** 11
R = 2 * 10 ** 11

AS = N.times.map { rand((-10 ** 12)..(10 ** 12))  }


puts [N, L, R].join(' ')
puts AS.join(' ')

