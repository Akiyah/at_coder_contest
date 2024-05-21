# require "ac-library-rb/segtree"
require 'matrix'

$debug = !ARGV[0].nil?

N, B, K = STDIN.gets.chomp.split.map(&:to_i)
CS = STDIN.gets.chomp.split.map(&:to_i)

M = 10 ** 9 + 7


class Matrix
  def %(other)
    rows = @rows.collect {|row|
      row.collect {|e| e % other }
    }
    return new_matrix rows, column_count
  end
end

def calc_range
  rs = []
  (B + 1).times do |b|
    r = (10 ** b) % B
    a = rs.find_index(r)
    rs << r
    # pp ['b, r, a, rs', b, r, a, rs] if $debug
    return [a, b] if a
  end
end

def calc_ranges
  r0, r1 = calc_range
  pp ['r0, r1', r0, r1] if $debug

  d = r1 - r0
  c = (N - r0) / d
  s = c * d

  [r0, r1, d, c, s]
end

def power(m, c)
  m2 = m
  pm = m ** 0

  digits = c.to_s(2).split('').map(&:to_i)
  # puts digits if $debug
  digits.reverse.each do |d|
    if d == 1
      pm *= m2
      pm %= M
    end
    m2 = m2 ** 2
    m2 %= M
  end

  pm % M
end

def create_m
  r0, r1, d, c, s = calc_ranges
  pp ['r0, r1, d, c, s ', r0, r1, d, c, s] if $debug

  m = Matrix.unit(B)

  pp "step 1" if $debug
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

  pp "step 2" if $debug
  m2 = Matrix.unit(B)
  pp "step 2 a" if $debug
  (r0...r1).each do |i|
    pp "step 2 b0 #{i}" if $debug
    m1 = Matrix.zero(B)
    pp "step 2 b1 #{i}" if $debug
    CS.each do |c|
      c2 = c * (10 ** i)
      B.times do |b|
        m1[(c2 + b) % B, b] += 1
      end
    end
    pp "step 2 b2 #{i}" if $debug
    # pp m1 if $debug
    # pp m2 if $debug
    
    m2 *= m1
    pp "step 2 b3 #{i}" if $debug
  end
  pp "step 2 c" if $debug
  m3 = power(m2, c)
  pp "step 2 d" if $debug
  m *= m3

  pp "step 3" if $debug
  (r0...(N - s)).each do |i|
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
# pp m if $debug
puts m[0, 0] % M
