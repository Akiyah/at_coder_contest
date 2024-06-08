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

N, M = STDIN.gets.chomp.split.map(&:to_i)
HS = STDIN.gets.chomp.split.map(&:to_i)

def count
  s = 0
  c = 0
  (1..N).each do |i|
    s += HS[i - 1]
    if M < s
      return c
    end
    c += 1
  end
  return N
end

puts count

