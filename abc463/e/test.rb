
# N, M, Y = STDIN.gets.chomp.split.map(&:to_i)
# UVTS = (1..M).map do
#   STDIN.gets.chomp.split.map(&:to_i)
# end
# XS = STDIN.gets.chomp.split.map(&:to_i)


100.times do |i|

  n = 4
  m = 4
  y = rand(10) + 1
  uvts = {}
  while uvts.length < m
    u = rand(n) + 1
    v = rand(n) + 1
    t = rand(10) + 1
    uvts[[u, v]] ||= t
  end
  xs = n.times.map { rand(10) + 1 }

  File.open('test/sample.in', 'w') do |f|
    f.puts [n, m, y].join(' ')
    uvts.each do |uv, t|
      f.puts (uv + [t]).join(' ')
    end
    f.puts xs.join(' ')
  end
  
  o1 = `ruby main.rb < test/sample.in`
  o2 = `ruby main_simple.rb < test/sample.in`

  pp(i:, 'o1 == o2' => o1 == o2)
  unless o1 == o2
    break
  end
end
