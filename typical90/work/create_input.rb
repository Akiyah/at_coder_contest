N = 100000

S = ('a'..'z').to_a.join * (N / 26)
puts N
(1...N).each do |i|
  puts "#{i} #{i + 1}"
end
