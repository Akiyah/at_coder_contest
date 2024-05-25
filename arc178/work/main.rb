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
  a, b = b, a if b < a

  return 0 if b < c - 1
  return 0 if c < b

  if b == c - 1
    r = ((10 ** a) - 1) * (10 ** a) / 2 - (10 ** (a - 1)) * (10 ** (a - 1) - 1) / 2
    pp r if $debug
    return r % M
  end

  r1 = (10 ** b - 10 ** (b - 1)) * (10 ** a - 10 ** (a - 1))
  r2 = ((10 ** a) - 1) * (10 ** a) / 2 - (10 ** (a - 1)) * (10 ** (a - 1) - 1) / 2
  pp (r1 - r2) if $debug
  (r1 - r2) % M
end

A1A2A3S.each do |a1, a2, a3|
  puts calc(a1, a2, a3)
end
