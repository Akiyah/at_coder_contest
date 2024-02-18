H, W, N = gets.chomp.split.map(&:to_i)
TS = gets.chomp.split('')
SS = (1..H).map do
  gets.chomp.split('').map { |s| s == '.' ? '1' : '0' }.join.to_i(2)
end

# pp SS

points = SS.clone

def step_one(t, points)
  di = dj = 0

  case t
  when 'U'
    di = -1
  when 'D'
    di = 1
  when 'L'
    dj = -1
  when 'R'
    dj = 1
  end

  new_points = []
  new_points[0] = SS[0]
  new_points[H - 1] = SS[H - 1]
  (1...(H - 1)).each do |i|
    new_points[i] = SS[i] & (points[i - di] >> dj)
  end
  new_points
end

def step(points)
  TS.each do |t|
    points = step_one(t, points)
  end
  points
end


points = step(points)

result = points.sum do |line|
  # pp line.to_s(2)
  line.to_s(2).split('').count('1')
end
puts result
