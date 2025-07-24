#!/usr/bin/env ruby


# H = 2 * 10 ** 2
# W = 10 ** 3

# H = 2 * 10 ** 5
# W = 1

H = 1
W = 2 * 10 ** 5

AS = H.times.map do
  W.times.map { 1 }
end
PS = (H + W - 1).times.map { 1 }

puts [H, W].join(' ')
AS.each do |rows|
  puts rows.join(' ')
end
puts PS.join(' ')
