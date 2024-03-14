N = 100

puts N

(1..N).each do
  puts rand(1000000000000) + 1
end

