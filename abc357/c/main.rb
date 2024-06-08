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

def tile(k)
  if k == 0
    return [['#']]
  end

  t0 = tile(k - 1)
  t = (0...(3 ** k)).map do |i|
    (0...(3 ** k)).map do |j|
      i1 = i / (3 ** (k - 1))
      j1 = j / (3 ** (k - 1))
      i2 = i % (3 ** (k - 1))
      j2 = j % (3 ** (k - 1))
      if i1 == 1 && j1 == 1
        '.'
      else
        t0[i2][j2]
      end
    end
  end
  t
end


tile(N).each do |row|
  puts row.join('')
end
