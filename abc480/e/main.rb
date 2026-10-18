#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i

def value(m, a, d)
  r = m.times.map do |i|
    a + i * d
  end.inject(:*)
  # pp(m:, a:, d:, r:) if $debug
  r
end

def calc_3()
  r = 0

  a = 1
  while true
    # pp(a:) if $debug && a % 1000 == 0
    # pp(a:) if $debug
    return r if N < a ** 3
    
    d_max = (((8 * N * a + a ** 4) ** 0.5 - 3 * (a ** 2)) / (4 * a)).floor
    # pp(d_max:) if $debug


    # 条件を満たしていない場合は小さくする
    while 0 < d_max && N < a * (a + d_max) * (a + 2 * d_max)
      pp(a:, d_max:, type: '-1') if $debug
      d_max -= 1
    end

    # もう1つ大きくできる場合
    while a * (a + (d_max + 1)) * (a + 2 * (d_max + 1)) <= N
      pp(a:, d_max:, type: '+1') if $debug
      d_max += 1
    end

    return r unless 0 < d_max

    r += d_max
    # pp(d_max:, r:) if $debug

    a += 1
  end
end

def calc_m(m)
  r = 0
  d_over_1 = 10 ** 9 + 1
  (1..(10 ** 6)).each do |a|
    d_over_1 = (1..d_over_1).bsearch { |d| N < value(m, a, d) }
    # pp(m:, a:, d_over_1:, r:) if $debug
    return r if d_over_1 == 1
    r += d_over_1 - 1
  end
  r
end


def calc()
  r = calc_3()
  # r2 = calc_m(3)
  pp(m: 3, r:, time: Time.now) if $debug
  (4..20).each do |m|
    dr = calc_m(m)
    r += dr
    pp(m:, dr:, r:, time: Time.now) if $debug
  end
  r
end


r = calc()

puts r
