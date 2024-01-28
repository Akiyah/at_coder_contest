N = gets.chomp.to_i
data = (1..N).map do
  gets.chomp.split.map(&:to_i)
end

px = data.map do |x, y| x end.sum
py = data.map do |x, y| y end.sum

if px == py
  puts 'Draw'
else
  puts (px > py) ? 'Takahashi' : 'Aoki'
end
