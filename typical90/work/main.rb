# require "ac-library-rb/segtree"
require 'matrix'

$debug = !ARGV[0].nil?

N, B, K = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)

M = 10 ** 9 + 7


def calc_range
  rs = []
  B.times do |b|
    r = (10 ** b) % B
    a = rs.find_index(r)
    return [a, b] if a
    rs << r
  end
end

r0, r1 = calc_range
pp calc_range if $debug

if $debug
  pp (0...r0)
  pp (r0...r1)
  d = r1 - r0
  c = (N - r0) / d
  s = c * d
  pp (s...N)

end


m = Matrix.unit(B)
N.times do |i|
  # pp [i, (10 ** i) % B] if $debug
  m1 = Matrix.zero(B)
  CS.each do |c|
    c2 = c * (10 ** i)
    B.times do |b|
      m1[(c2 + b) % B, b] += 1
    end
  end
  m *= m1
end

puts m[0, 0] % M
