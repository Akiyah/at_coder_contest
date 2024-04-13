H = 200
W = 200

AS = Array.new(H) { Array.new(W, '.') }

AS[0][0] = 'S'
AS[H - 1][W - 1] = 'T'
AS[H - 2][W - 1] = '#' # ゴールできないように
AS[H - 1][W - 2] = '#' # ゴールできないように

puts "#{H} #{W}"

AS.each do |row|
  puts row.join('')
end

es = []
(0...15).each do |i|
  (0...20).each do |j|
    e = (i + j + 1) * 10
    es << [1 + i * 9, 1 + j * 9, e]
  end
end

puts "#{es.length}"

es.each do |i, j, e|
  puts [i, j, e].join(' ')
end
