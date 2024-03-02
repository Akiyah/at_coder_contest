N = gets.chomp.to_i

k = Math.cbrt(N).to_i
i = k ** 3
loop do
  i = k ** 3
  break if i.to_s == i.to_s.reverse
  k -= 1
end

puts i
