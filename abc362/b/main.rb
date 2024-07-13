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

xa, ya = STDIN.gets.chomp.split.map(&:to_i)
xb, yb = STDIN.gets.chomp.split.map(&:to_i)
xc, yc = STDIN.gets.chomp.split.map(&:to_i)


def check(x1, y1, x2, y2)
  x1 * x2 + y1 * y2 == 0
end


if check(xa - xb, ya - yb, xc - xb, yc - yb) || check(xb - xa, yb - ya, xc - xa, yc - ya) || check(xa - xc, ya - yc, xb - xc, yb - yc) 
  puts 'Yes'
else
  puts 'No'
end

