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

N, S, T = STDIN.gets.chomp.split.map(&:to_i)
ABCDS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def calc_z(ps, z)
  s = 0
  x, y = 0, 0

  (0...N).each do |i|
    a, b, c, d = ABCDS[ps[i]]
    x0, y0 = (z[i] == 0 ? [a, b] : [c, d])
    x1, y1 = (z[i] == 0 ? [c, d] : [a, b])

    s1 = (((x - x0) ** 2 + (y - y0) ** 2) ** 0.5) / S
    s2 = (((x0 - x1) ** 2 + (y0 - y1) ** 2) ** 0.5) / T
    pp [s1, s2] if $debug
    s += s1 + s2
    x, y = x1, y1
  end

  s
end


def calc(ps)
  (0...(2 ** N)).map do |z|
    x = calc_z(ps, z)
    pp [ps, z, x] if $debug
    x
  end.min
end



m = (0...N).to_a.permutation.map do |ps|
  calc(ps)
end.min

puts m
