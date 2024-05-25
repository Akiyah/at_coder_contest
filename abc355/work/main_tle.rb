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


N = STDIN.gets.chomp.to_i
LRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def count

  lrs = LRS.sort_by! { |l, r| l }

  c = 0
  (0...N).each do |i|
    l, r = lrs[i]
    c += lrs[(1 + 1)..-1].count { |l2, r2| l2 <= r }
  end

  c
end

puts count
