#!/usr/bin/env ruby

N = 10000
M = 100
s = Set.new

data = []
N.times do |i|
  data[i] = Set.new((1..M).map { |j| i * M/10 + j })
end

N.times do |i|
  data[i].each do |j|
    s.add(j)
  end
end  

pp s.length # N * M
