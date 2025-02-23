N = 100
# chars = 'abcdefghijklmnopqrstuvwxyz-'.split('')
# chars = 'abc-'.split('')
chars = 'ab-'.split('')

puts N
(0...N).each do |i|
  puts (0...N).map { chars.sample }.join('')
end
