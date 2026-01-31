#!/usr/bin/env ruby


# N = rand(2..(2 * 10 ** 5))
N = rand(2..500)
# N = 2
# Q = rand(1..(2 * 10 ** 5))
XYS = (1..N).map do
  begin
    # x = rand((-10 ** 9)..(10 ** 9))
    # y = rand((-10 ** 9)..(10 ** 9))
    # x = rand((-10 ** 2)..(10 ** 2))
    # y = rand((-10 ** 2)..(10 ** 2))
    x = rand((-10 ** 1)..(10 ** 1))
    y = rand((-10 ** 1)..(10 ** 1))
    # x = rand(0..(10 ** 1))
    # y = rand((-10 ** 1)..0)
  end while x == 0 && y == 0
  [x, y]
end
abs = []
(1..N).each do |a|
  (1..N).each do |b|
    abs << [a, b] unless  a == b
  end
end

puts [N, abs.length].join(' ')
XYS.each do |x, y|
  puts [x, y].join(' ')
end
abs.each do |a, b|
  puts [a, b].join(' ')
end

