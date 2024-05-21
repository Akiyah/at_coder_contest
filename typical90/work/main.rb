# require "ac-library-rb/segtree"
require 'matrix'

$debug = !ARGV[0].nil?

N, B, K = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)

M = 10 ** 9 + 7


def calc_range
  rs = []
  (B + 1).times do |b|
    pp b if $debug
    r = (10 ** b) % B
    pp r if $debug
    a = rs.find_index(r)
    pp a if $debug
    rs << r
    pp rs if $debug
    return [a, b] if a
  end
end

def calc_ranges
  r0, r1 = calc_range
  pp [r0, r1] if $debug

  d = r1 - r0
  c = (N - r0) / d
  s = c * d

  [r0, r1, d, c, s]
end

def create_m
  r0, r1, d, c, s = calc_ranges

  m = Matrix.unit(B)

  (0...r0).each do |i|
    m1 = Matrix.zero(B)
    CS.each do |c|
      c2 = c * (10 ** i)
      B.times do |b|
        m1[(c2 + b) % B, b] += 1
      end
    end
    m *= m1
  end

  m2 = Matrix.zero(B)
  (r0...r1).each do |i|
    m1 = Matrix.zero(B)
    CS.each do |c|
      c2 = c * (10 ** i)
      B.times do |b|
        m1[(c2 + b) % B, b] += 1
      end
    end
    m2 *= m1
  end
  m3 = m2 ** c
  m *= m3

  (s...N).each do |i|
    m1 = Matrix.zero(B)
    CS.each do |c|
      c2 = c * (10 ** i)
      B.times do |b|
        m1[(c2 + b) % B, b] += 1
      end
    end
    m *= m1
  end

  m
end


m = create_m
pp m if $debug
puts m[0, 0] % M
