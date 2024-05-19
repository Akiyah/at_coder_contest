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


def calc(a1, a2, a3)
  a1, a2 = a2, a1 if a2 < a1

  return 0 if a2 < a3 - 1

  if a2 == a3 - 1
    return 0 # todo

  end

  # a2 == a3
  r10 = (10 ** (a1 - 1))
  r11 = (10 ** (a1) - 1)
  r20 = (10 ** (a2 - 1))
  r21 = (10 ** (a2) - 1)

  r1 = r11 - r10 + 1
  r2 = r21 - r20 + 1

  r = r2 * r1 - (((r11 + 1) * r11) / 2 - ((r10 - 1 + 1) * r10 - 1) / 2)
  r % M
end

A1A2A3S.each do |a1, a2, a3|
  puts calc(a1, a2, a3)
end
