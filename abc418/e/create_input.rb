#!/usr/bin/env ruby

N = 2000
puts N

xys = []
while xys.length < N
  x = rand(10 ** 4 + 1)
  y = rand(10 ** 4 + 1)

  next if xys.include?([x, y])

  dxys = xys.map do |x1, y1|
    dx = x - x1
    dy = y - y1
    if dx < 0
      dx *= -1
      dy *= -1
    end
    if dx == 0 && dy < 0
      dy *= -1
    end
    g = dx.gcd(dy)
    dx /= g
    dy /= g
    [dx, dy]
  end

  if dxys.uniq.length == xys.length
    puts [x, y].join(' ')
    pp(length: xys.length)
    xys << [x, y]
  end
end



