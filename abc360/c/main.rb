# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split(' ').map(&:to_i)
WS = STDIN.gets.chomp.split(' ').map(&:to_i)

def count
  sum = Array.new(N, 0)
  max = Array.new(N, 0)
  (0...N).each do |i|
    a = AS[i]
    w = WS[i]
    sum[a - 1] += w
    if max[a - 1] < w
      max[a - 1] = w
    end
  end

  c = 0
  (0...N).each do |i|
    next if sum[i] == 0
    c += sum[i] - max[i]
  end
  c
end

puts count
