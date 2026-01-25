#!/usr/bin/env ruby


N = 2 * 10 ** 5
Q = 2 * 10 ** 5
XYS = (1..N).map do
  begin
    x = rand(2 * 10 ** 9) - 10 ** 9
    y = rand(2 * 10 ** 9) - 10 ** 9
  end while x == 0 && y == 0
  [x, y]
end
ABS = (1..Q).map do
  begin
    a = rand(N) + 1
    b = rand(N) + 1
  end while a == b
  [a, b]
end

puts [N, Q].join(' ')
XYS.each do |x, y|
  puts [x, y].join(' ')
end
ABS.each do |a, b|
  puts [a, b].join(' ')
end

