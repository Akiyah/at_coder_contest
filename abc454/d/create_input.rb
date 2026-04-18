#!/usr/bin/env ruby

T = 1
puts T

# N = 10 ** 6
N = 10 ** 5

a = N.times.map { ['(', 'x', ')'].sample }.join('')
b = N.times.map { ['(', 'x', ')'].sample }.join('')
puts a
puts b
