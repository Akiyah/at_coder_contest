#!/usr/bin/env ruby

$debug = !ARGV[0].nil?

def snake?(i)
  as = i.to_s.split('').map(&:to_i)
  as[1..].all? { |a| a < as[0] }
end

def calc_simple(x)
  (10..x).select do |i|
    snake?(i)
  end.length
end


def calc_0(xs) # 桁が少ないヘビ数の数
  n = xs.length

  return 0 if n - 1 < 2

  (1..9).map do |i|
    (2...n).map do |m|
      i ** (m - 1)
    end.sum
  end.sum
end

def calc_1(xs)
  n = xs.length
  x0 = xs[0]
  return 0 if x0 <= 1
  return 0 if n < 2

  (1...x0).map do |i|
    i ** (n - 1)
  end.sum
end

def calc_2_one(x0, xs)
  n = xs.length
  return 1 if n == 0

  if x0 <= xs[0]
    x0 * (x0 ** (n - 1))
  else
    ra = xs[0] * (x0 ** (n - 1))
    rb = calc_2_one(x0, xs[1..])
    pp ({ x0:, xs:, ra:, rb: }) if $debug
    ra + rb
  end
end

def calc_2(xs)
  return 0 if xs.length <= 1
  x0 = xs[0]
  calc_2_one(x0, xs[1..])
end


def calc(x)
  xs = x.to_s.split('').map(&:to_i)

  r0 = calc_0(xs)
  r1 = calc_1(xs)
  r2 = calc_2(xs)

  pp ({ xs:, r0:, r1:, r2: }) if $debug
  r0 + r1 + r2
end




def check
  (9..1000).each do |x|
    rs = [x, calc_simple(x), calc(x)]
    pp rs
    return if rs[1] != rs[2]
  end
end

check




