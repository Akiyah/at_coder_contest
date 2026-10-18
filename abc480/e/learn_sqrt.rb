#!/usr/bin/env ruby

a = 10 ** 18 - 1
while true
  pp(a:) if a % 100000 == 0

  a2 = (a ** 0.5).floor

  if a2.integer? && a <= a2 ** 2
    pp(a:, a2:)
    break
  end
  a += 1
end
