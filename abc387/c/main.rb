#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


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

L, R = STDIN.gets.chomp.split.map(&:to_i)


def calc_0(n, m = 9) # n桁のヘビ数
  (1..m).map do |i|
    i ** (n - 1)
  end.sum
end


def calc_2(x0, xs)
  pp [x0, xs] if $debug
  n = xs.length

  if n == 0
    return 0
  end

  if n == 1
    if x0 <= xs[0]
      return x0
    else
      return xs[0] + 1
    end
  end

  if x0 <= xs[0]
    return (x0 - 1) ** n
  end

  r1 = calc_2(x0, xs[1..])
  r2 = xs[0] * x0 ** (n - 1)
  pp ['x0', x0, 'xs[0]', xs[0], 'r1', r1, 'r2', r2] if $debug
  return r1 + r2
end


def calc(x)
  xs = x.to_s.split('').map(&:to_i)
  n = xs.length

  r0 = (2..(n - 1)).map { |i| calc_0(i) }.sum
  r1 = (1...xs[0]).map { |i| calc_0(n - 1, i) }.sum
  r2 = calc_2(xs[0], xs[1..])
  pp [xs, r0, r1, r2] if $debug
  r0 + r1 + r2
end

# pp [calc(R), calc(L - 1)] if $debug

puts calc(R) - calc(L - 1)




