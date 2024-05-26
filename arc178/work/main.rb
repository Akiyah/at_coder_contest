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


P10_2 = []
def p10_2(i)
  return 10 % M if i == 0
  if P10_2[i] == nil
    P10_2[i] = p10_2(i - 1) ** 2 % M
  end
  P10_2[i]
end


def p10(a)
  return 10.pow(a, M)
  r = 1
  a.digits(2).each.with_index do |b, i|
    r = (r * p10_2(i)) % M if b == 1
  end
  r
end

def calc_r2(a)
  return 45 if a == 1
  # ((10 ** a) - 1) * (10 ** a) / 2 - (10 ** (a - 1)) * (10 ** (a - 1) - 1) / 2
  (p10(a) - 1) * 5 * p10(a - 1) - 5 * p10(a - 2) * (p10(a - 1) - 1)
end

def calc(a, b, c)
  a, b = b, a if b < a

  return 0 if b < c - 1
  return 0 if c < b

  if b == c - 1
    if a < b
      r2 = calc_r2(a)
      pp r2 if $debug
      return r2 % M
    else
      r1 = (p10(a) - p10(a - 1) + 1) * (p10(a) - p10(a - 1)) / 2 - p10(a - 1) * (p10(a - 1) - 1) / 2
      r2 = (p10(a) - p10(a - 1)) * (p10(a - 1) - 1)
      return (r1 + r2) % M
    end
  end

  if a < b
    r1 = (p10(b) - p10(b - 1)) * (p10(a) - p10(a - 1))
    r2 = calc_r2(a)
    pp (r1 - r2) if $debug
    return (r1 - r2) % M
  end

  r = (p10(a) - p10(a - 1)) * (p10(a) - 2 * p10(a - 1)) - (p10(a) - p10(a - 1)) * (p10(a) - p10(a - 1) - 1) / 2 + p10(a - 1) * (p10(a - 1) - 1) / 2
  r % M
end

A1A2A3S.each do |a1, a2, a3|
  puts calc(a1, a2, a3)
end
