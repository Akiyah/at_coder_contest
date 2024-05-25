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
  c = 0
  (1..(N-1)).each do |i|
    ((i+1)..N).each do |j|
      l1, r1 = LRS[i - 1]
      l2, r2 = LRS[j - 1]
      pp [[l1, r1], [l2, r2]] if $debug
      unless r2 < l1 || r1 < l2
        pp [[l1, r1], [l2, r2], 'in'] if $debug
        c += 1
      end
    end
  end
  c
end

puts count
