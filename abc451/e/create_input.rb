#!/usr/bin/env ruby

N = 3000
puts N

ds = N.times.map do |i|
  N.times.map do |j|
    if i == j
      0
    elsif i == 0
      j + 2
    elsif j == 0
      i + 2
    else
      (i + 2) + (j + 2)
    end
  end
end

(0...(N - 1)).each do |i|
  puts ds[i][(i + 1)..].join(' ')
end
