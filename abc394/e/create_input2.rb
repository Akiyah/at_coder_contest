puts 100
50.times do |i|
  puts (('-' * i) + 'ab' + ('-' * 100))[0...100]
end
50.times do |i|
  puts (('-' * (50 + i)) + 'ba' + ('-' * 100))[0...100]
end
