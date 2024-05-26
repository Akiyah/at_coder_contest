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

# inf = (1 << 60) - 1
# seg_max = AcLibraryRb::Segtree.new(rs, -inf) { |x, y| [x, y].max }

M = 998244353

T = STDIN.gets.chomp.to_i
A1A2A3S = (1..T).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc(a, b, c)

  count = 0
  (1..(10.pow(a))).each do |x|
    (1..(10.pow(b))).each do |y|
      if x.to_s.length == a && y.to_s.length == b
        z = x + y
        count += 1 if z.to_s.length == c
      end
    end
  end
  count
end

A1A2A3S.each do |a1, a2, a3|
  puts calc(a1, a2, a3)
end
