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
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def plus(a, b)
  [a[0] + b[0], a[1] + b[1]]
end

def multi(a, m)
  [a[0] * m, a[1] * m]
end

def minus(a, b)
  plus(a, multi(b, -1))
end

def ip(a, b)
  a[0] * b[0] + a[1] * b[1]
end

def l(a)
  Math.sqrt(ip(a, a))
end

def d(a, b)
  l(minus(a, b))
end


def calc_line_point(s, p, d)
  pp(s:, p:, d:) if $debug
  return l(s) if p == [0, 0]

  # f2 = ip(s, s) + 2 * t * ip(s, p)  +  (t ** 2) * ip(p, p)
  # f2_ = 2 * ip(s, p)  +  2 * t * ip(p, p)
  t = - ip(s, p) / ip(p, p) # (最小の可能性)
  pp(t:, d: l(plus(s, multi(p, t)))) if $debug

  t = 0 if t < 0
  t = d if d < t
  pp(t:, d: l(plus(s, multi(p, t)))) if $debug

  l(plus(s, multi(p, t)))
end


def calc_case_n(ts, tg, td, as, ag, ad) # ad <= td
  pp(ts:, tg:, td:, as:, ag:, ad:) if $debug
  p = multi(minus(tg, ts), 1.0 / td)
  q = multi(minus(ag, as), 1.0 / ad)

  tm = plus(ts, multi(p, ad)) # ad秒後のt側の位置
  pp(tm:) if $debug

  r1 = calc_line_point(minus(ts, as), minus(p, q), ad) # 0 ~ ad までの最短
  pp(r1:) if $debug
  r2 = calc_line_point(minus(tm, ag), p, td - ad) # ad ~ td までの最短
  pp(r2:) if $debug

  [r1, r2].min
end

def calc_case(ts, tg, as, ag)
  pp(ts:, tg:, as:, ag:) if $debug
  td = d(tg, ts)
  ad = d(ag, as)

  if ad <= td
    calc_case_n(ts, tg, td, as, ag, ad)
  else
    calc_case_n(as, ag, ad, ts, tg, td)
  end
end



T.times do
  tsx, tsy, tgx, tgy = STDIN.gets.chomp.split.map(&:to_i)
  asx, asy, agx, agy = STDIN.gets.chomp.split.map(&:to_i)
  puts calc_case([tsx, tsy], [tgx, tgy], [asx, asy], [agx, agy])
end








