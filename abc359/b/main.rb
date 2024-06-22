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
AS = STDIN.gets.chomp.split.map(&:to_i)

def count
  c = 0
  (1..N).each do |x|
    i = AS.find_index(x)
    j = AS[(i + 1)..-1].find_index(x)
    c += 1 if j == 1
  end
  c
end


puts count


