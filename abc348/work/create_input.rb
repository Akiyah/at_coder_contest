H = 200
W = 200
N = 300

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
while es.size <= N
  i = (0...H).to_a.sample
  j = (0...W).to_a.sample
  e = (1..(H * W)).to_a.sample
  if AS[i][j] == '.'
    AS[i][j] == e
    es << [i, j, e]
  end
end

puts "#{N}"

es.each do |i, j, e|
  puts [i, j, e].join(' ')
end
