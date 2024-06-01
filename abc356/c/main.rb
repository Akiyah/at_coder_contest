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


N, M, K = STDIN.gets.chomp.split.map(&:to_i)
CARS = (1..M).map do
  cars = STDIN.gets.chomp.split
  c = cars[0].to_i
  as = cars[1...-1].map(&:to_i)
  r = cars[-1]
  [c, as, r]  
end

pp N, M, K, CARS if $debug

xrs = CARS.map do |c, as, r|
  x = as.sum { |a| 2 ** (a - 1) }
  [x, r]
end

def filter(bs, x, r)
  new_bs = bs.select do |b|
    co = (b & x).digits(2).count(1)
    (K <= co && r == 'o') || (co < K && r == 'x')
  end
  new_bs
end

bs = (0...(2 ** N)).to_a
xrs.each do |x, r|
  bs = filter(bs, x, r)
end

puts bs.count

