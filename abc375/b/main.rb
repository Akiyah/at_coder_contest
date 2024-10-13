# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N = STDIN.gets.chomp.to_i
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


x0 = 0
y0 = 0
r = 0
XYS.each do |x, y|
  r += ((x - x0) ** 2 + (y - y0) ** 2) ** 0.5
  x0 = x
  y0 = y
end

x, y = XYS[-1]
r += ((x - 0) ** 2 + (y - 0) ** 2) ** 0.5


puts r
