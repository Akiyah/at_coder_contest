N = 2000
puts N

while true
  xys = (1..N).map do
    [rand(10 ** 9), rand(10 ** 9)]
  end

  if xys.uniq.length == N
    xys.each do |x, y|
      puts [x, y].join(' ')
    end
    exit
  end
end
