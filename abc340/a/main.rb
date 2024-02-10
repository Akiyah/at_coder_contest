a, b, d = gets.chomp.split.map(&:to_i)

#pp [a, b, d]

resuts = []
(a..b).step(d) do |i|
  resuts << i
end

puts resuts.join(' ')
