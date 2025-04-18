# require "ac-library-rb/priority_queue"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# N = STDIN.gets.chomp.to_i
# AS = (1..N).map do
#   STDIN.gets.chomp.split.map(&:to_i)
#   STDIN.gets.chomp.to_i
# end

# pq = AcLibraryRb::PriorityQueue.new


N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp N if $debug
pp XYS if $debug

xys0 = []
xys1 = []
XYS.each do |x, y|
  if (x + y) % 2 == 0
    xys0 << [(x + y) / 2, (x - y) / 2]
  else
    xys1 << [(x + y - 1) / 2, (x - y - 1) / 2]
  end
end

def calc_sum(xys)
  n = xys.length

  rx = 0
  xs = xys.map { |x,y| x }.sort
  nx = n
  while 1 < nx
    x0 = xs.shift
    x1 = xs.pop
    nx -= 2
    rx += (x1 - x0) * (1 + nx)
  end

  ry = 0
  ys = xys.map { |x,y| y }.sort
  ny = n
  while 1 < ny
    y0 = ys.shift
    y1 = ys.pop
    ny -= 2
    ry += (y1 - y0) * (1 + ny)
  end

  rx + ry
end

d = 0
d += calc_sum(xys0)
d += calc_sum(xys1)

puts d
