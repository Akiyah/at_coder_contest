#!/usr/bin/env ruby

N = 10000
M = 100
s = {}

data = []
N.times do |i|
  data[i] = {}
  (1..M).each do |j|
    data[i][i * M/10 + j] = true
  end
end

N.times do |i|
  s.update(data[i])
end  

pp s.length # N * M
