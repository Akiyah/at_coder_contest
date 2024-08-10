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
AS = (1..N).map do
  (1..N).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end
end

Q = STDIN.gets.chomp.to_i
QUERYS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


$ss = []

def ss(x, y, z)
  return 0 if x < 0 || y < 0 || z < 0

  $ss[x][y][z]
end


def ss2(x, y, z)
  ss(x - 1, y - 1, z - 1)
end

def ss_(x, y, z, v)
  $ss[x] ||= []
  $ss[x][y] ||= []
  $ss[x][y][z] ||= []
  $ss[x][y][z] = v
end

(0...N).each do |x|
  (0...N).each do |y|
    sz = 0
    (0...N).each do |z|
      sx = ss(x - 1, y, z)
      sy = ss(x, y - 1, z) - ss(x - 1, y - 1, z)
      sz += AS[x][y][z]

      v = sx + sy + sz
      pp [x, y, z, sx, sy, sz, v] if $debug
      ss_(x, y, z, v)

      # pp [x, y, z, sx, sy, sz, ss[x][y][z]] if $debug
    end
  end
end


pp $ss if $debug


QUERYS.each do |lx, rx, ly, ry, lz, rz|
  s = 0

  s = ss2(rx, ry, rz)
  s -= ss2(lx - 1, ry, rz)
  s -= ss2(rx, ly - 1, rz)
  s -= ss2(rx, ry, lz - 1)
  s += ss2(lx - 1, ly - 1, rz)
  s += ss2(rx, ly - 1, lz - 1)
  s += ss2(lx - 1, ry, lz - 1)
  s -= ss2(lx - 1, ly - 1, lz - 1)

  puts s
end