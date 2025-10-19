
# T = 3 * 10 ** 5
T = 3 * 10 ** 3
puts T

T.times do
  # c = rand(2 * 10 ** 8)
  # d = rand(5 * 10 ** 9)
  c = rand(2 * 10 ** 3)
  d = rand(5 * 10 ** 4)
  puts [c, d].join(' ')
end
