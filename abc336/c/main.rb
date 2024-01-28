n = gets.chomp.to_i

s = (n - 1).to_s(5)
# pp s
result = s.split('').map(&:to_i).map do |i|
  i * 2
end.join('')

puts result
