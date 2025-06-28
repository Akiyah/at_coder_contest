T = 1
puts T

h = 50
w = 50
puts [h, w].join(' ')

h.times do
  ss = w.times.map { 0.5 < rand ? '#' : '.' }
  puts ss.join('')
end

