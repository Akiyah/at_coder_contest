#!/usr/bin/env ruby

T = 100
H = 5
W = 5

puts T

T.times do
  puts [H, W].join(' ')

  H.times do
    s = W.times.map do
      rand(5) == 0 ? '.' : '#'
    end.join('')
    puts s
  end
end



