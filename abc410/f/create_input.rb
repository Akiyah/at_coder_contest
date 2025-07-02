T = 1
puts T

h = 548
w = 547
puts [h, w].join(' ')

h.times do
  ss = w.times.map { 0.5 < rand ? '#' : '.' }
  puts ss.join('')
end

