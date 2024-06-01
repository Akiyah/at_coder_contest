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

R = 998244353

N, M = STDIN.gets.chomp.split.map(&:to_i)


def popcount(x)
  x.digits(2).count(1)
end

def compact(ns)
  while ns[-1] == 0
    ns = ns[0...-1]
  end
  ns
end


def calc2(ns, ms)
  pp ["ns", ns, "ms", ms] if $debug
  ns = compact(ns)
  ms = compact(ms)

  if ns.length == 0
    pp "zero" if $debug
    return 0
  end


  i = ns.length # i > 0
  ns1 = ns[0...-1]
  r = calc2(ns1, ms)
  j = i - 1
  r2 = 0 < j ? (2 ** (j - 1)) * (ms[0...j].count(1)) : 0
  if ms[i - 1] == nil || ms[i - 1] == 0
    pp ["r", r, "r2", r2] if $debug
    return r + r2
  else
    n1 = ns1.map.with_index { |d, i| d * (2 ** i) }.sum + 1
    pp ["r", r, "r2", r2, "n1", n1, "ns1", ns1] if $debug
    return n1 + r + r2
  end
end


def calc(n, m)
  ns = n.digits(2)
  ms = m.digits(2)
  calc2(ns, ms)
end


puts calc(N, M) % R

