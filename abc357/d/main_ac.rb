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
R = 998244353
# R = (10 ** 1000)


$cashe_pow_10_2k = {}
def pow_10_2k(k) # m = 2**k
  return $cashe_pow_10_2k[k] if $cashe_pow_10_2k[k]

  if k == 0
    $cashe_pow_10_2k[k] = 10
  else
    $cashe_pow_10_2k[k] = pow_10_2k(k - 1).pow(2, R)
  end
  $cashe_pow_10_2k[k]
end
def pow_10(m) # (10 ** m) % R
  r = 1
  m.digits(2).map.with_index do |d, k|
    r *= pow_10_2k(k) if d == 1
  end
  r % R
end


$cashe_calk_2k = {}
def calc_2k(k) # m = 2**k
  pp ['calc_2k', k] if $debug
  return $cashe_calk_2k[k] if $cashe_calk_2k[k]
  pp ['calc_2k', k, '*'] if $debug

  if k == 0
    $cashe_calk_2k[k] = N % R
  else
    x = calc_2k(k - 1)
    # pp "***"
    # pp x
    # pp pow_10_2k(k - 1)
    $cashe_calk_2k[k] = (x * (pow_10_2k(k - 1).pow(N.to_s.length, R)) + x) % R
  end
  $cashe_calk_2k[k]
end


def calc(m)
  pp m.digits(2) if $debug
  s = 0
  rs = m.digits(2).map.with_index do |d, i|
    pp ['a', d, i] if $debug
    if d == 1
      r = calc_2k(i) * pow_10(s)
      pp ['b', calc_2k(i), pow_10(s), i, s, r] if $debug
      s += (2 ** i) * N.to_s.length
      pp ['c', calc_2k(i), pow_10(s), i, s, r] if $debug
      r
    else
      0
    end
  end
  pp rs if $debug
  rs.sum % R
end


puts calc(N)
