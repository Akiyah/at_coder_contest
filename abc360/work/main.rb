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


# Use `x.pow(m - 2, m)` instead of `inv_mod(x, m)` if m is a prime number.
def inv_mod(x, m)
  z = _inv_gcd(x, m)
  raise ArgumentError unless z.first == 1

  z[1]
end

def _inv_gcd(a, b)
  a %= b # safe_mod

  s, t = b, a
  m0, m1 = 0, 1

  while t > 0
    u = s / t
    s -= t * u
    m0 -= m1 * u

    s, t = t, s
    m0, m1 = m1, m0
  end

  m0 += b / s if m0 < 0
  [s, m0]
end



N, K = STDIN.gets.chomp.split.map(&:to_i)

R = 998244353

n_ = inv_mod(N, R)
n_2 = (n_ ** 2) % R
# n_ = Rational(1, N)
# n_2 = (n_ ** 2)

r1 = 1
rn = 0
pp [r1, rn] if $debug
(1..K).each do |i|
  r1_ = (r1 * N + r1 * (N - 1) * (N - 2) + rn * 2 * (N - 1)) * n_2
  rn_ = (rn * (N ** 2 - 2) + r1 * 2) * n_2
  r1 = r1_ % R
  rn = rn_ % R

  # r1 = r1 + rn * 2 * (N  - 1)
  # rn = r1 * 2 + rn + rn * (N - 2)
  pp [r1, rn] if $debug
end

puts (r1 + rn * ((N * (N + 1) / 2) - 1)) % R
