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

T = STDIN.gets.chomp.to_i

def f(x, y)
  (x.to_s + y.to_s).to_i
end



def calc_one_l(c0, c1, l, l_2, n, b) # xがl桁の場合を計算する。n桁まで計算できていたとする
  pp(c0:, c1:, l:, l_2:, n:, b:) if $debug

  r = 0
  if l_2 == n
    is = (n == 1) ? (1..9) : (0..9)
    is.each do |i| # 残っている最高の桁
      b2 = b + i
      pp(b2:) if $debug
      if c0 <= b2 ** 2 && b2 ** 2 <= c1
        r += 1
      end
      pp(b2:, r:) if $debug
    end
    pp(n:, r:) if $debug
    return r
  end

  is = (n == 1) ? (1..9) : (0..9)
  is.each do |i| # 残っている最高の桁
    b2 = b + i * (10 ** (l_2 - n))
    b2_ = b + (i + 1) * (10 ** (l_2 - n)) - 1
    pp(b2:, b2_:) if $debug
    next if b2_ ** 2 < c0
    next if c1 < b2 ** 2
    if c0 <= b2 ** 2 && b2_ ** 2 <= c1
      r += 10 ** (l_2 - n)
    elsif 
      r += calc_one_l(c0, c1, l, l_2, n + 1, b2)
    end
  end
  pp(n:, r:) if $debug
  r
end

def calc_one(c, d)
  pp(name: 'calc_one', c:, d:) if $debug
  r = 0
  lc = c.to_s.length
  ld = d.to_s.length
  (1...ld).each do |l|
    l_2 = (lc + l + 1) / 2
    c0 = c * (10 ** l) + 1
    c1 = (c + 1) * (10 ** l)
    r += calc_one_l(c0, c1, l, l_2, 1, 0)
  end

  l_2 = (lc + ld + 1) / 2
  c0 = c * (10 ** ld) + 1
  c1 = c * (10 ** ld) + d
  r += calc_one_l(c0, c1, ld, l_2, 1, 0)

  pp(name: 'calc_one', c:, d:, r:) if $debug
  r
end

def calc(c, d)
  r = calc_one(c, c + d) - calc_one(c, c)
  r
end


T.times do
  c, d = STDIN.gets.chomp.split.map(&:to_i)
  pp(c:, d:) if $debug


  puts calc(c, d)
end



