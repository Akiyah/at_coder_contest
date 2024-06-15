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


N, M = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..N).map do
  STDIN.gets.chomp.split('').map { |s| s == 'o' }
end

def calc(k)
  (0...N).to_a.combination(k).each do |combination|
    rs = [false] * M
    combination.each do |i|
      rs = rs.map.with_index do |r, j| r || SS[i][j] end
    end
    return true if rs.all? { |r| r }
  end
  false
end

def count
  (1..N).each do |k|
    return k if calc(k)
  end
end

puts count
