#!/usr/bin/env ruby


# H = 2 * 10 ** 2
# W = 10 ** 3

# H = 2 * 10 ** 5
# W = 1

def calk_hw
  while true
    h = rand(2 * 10 ** 5 - 1) + 1
    w = rand(2 * 10 ** 5 - 1) + 1
    return h, w if h * w <= 2 * 10 ** 5
  end
end

H, W = calk_hw

AS = H.times.map do
  W.times.map { rand(10 ** 9 - 1) + 1 }
end
PS = (H + W - 1).times.map { rand(10 ** 9 - 1) + 1 }

puts [H, W].join(' ')
AS.each do |rows|
  puts rows.join(' ')
end
puts PS.join(' ')
