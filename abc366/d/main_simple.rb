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


QUERYS.each do |lx1, rx1, ly1, ry1, lz1, rz1|
  s = 0
  (lx1..rx1).each do |x|
    (ly1..ry1).each do |y|
      (lz1..rz1).each do |z|
        s += AS[x - 1][y - 1][z - 1]
      end
    end
  end
  puts s
end