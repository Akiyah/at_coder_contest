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
  rx = (1..n).sum do |i|
    (1..n).sum do |j|
      x0, y0 = xys[i - 1]
      x1, y1 = xys[j - 1]
      (x0 - x1).abs
    end
  end
  ry = (1..n).sum do |i|
    (1..n).sum do |j|
      x0, y0 = xys[i - 1]
      x1, y1 = xys[j - 1]
      (y0 - y1).abs
    end
  end
  (rx + ry) / 2
end

d = 0
d += calc_sum(xys0)
d += calc_sum(xys1)

puts d
