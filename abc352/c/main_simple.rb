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

def dist(a, b)
  pp [a, b] if $debug
  ax, ay = a
  bx, by = b
  return 0 unless ((ax - bx) + (ay - by)) % 2 == 0

  r = (((ax + ay) - (bx + by)).abs + ((ax - ay) - (bx - by)).abs) / 2
  pp r if $debug
  r
end


d = 0
(1...N).each do |i|
  ((i + 1)..N).each do |j|
    d += dist(XYS[i - 1], XYS[j - 1])
  end
end

pp dist([0, 0], [1, 3]) if $debug
pp dist([0, 0], [5, 6]) if $debug
pp dist([1, 3], [5, 6]) if $debug

puts d
