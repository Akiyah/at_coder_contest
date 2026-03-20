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

MOD = 10007

K, M = STDIN.gets.chomp.split.map(&:to_i)
CLS = (1..K).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def plus(a, b) # a = [(x / M) % MOD, x % M], x = a[0] * M + a[1]
  s = (a[1] + b[1]).divmod(M)
  t0 = (a[0] + b[0] + s[0]) % MOD
  t1 = s[1]
  [t0, t1]
end

def multi(a, b)
  s = (a[1] * b[1]).divmod(M)
  t0 = (a[0] * b[0] * M + a[0] * b[1] + a[1] * b[0] + s[0]) % MOD
  t1 = s[1]
  [t0, t1]
end

def l_to_r(l, a10s, a11s)
  bs = l.to_s(2).chars.map(&:to_i).reverse
  d = 0
  r10 = 1.divmod(M)
  r11 = 0.divmod(M)
  bs.each.with_index do |b, i|
    next if b == 0
    pp(b:, i:) if $debug

    r11 = plus(r11, multi(a11s[i], r10))
    r10 = multi(r10, a10s[i + 1])
    pp(b:, i:, r10:, r10_int: to_M_int(r10), r11:, r11_int: to_M_int(r11)) if $debug
  end
  [r10, r11]
end

def to_M_int(a)
  a[0] * M + a[1]
end

a10s = []
a11s = []
a10s[0] = 1.divmod(M) # 10 ** 0 = 1
a11s[0] = 1.divmod(M)
a10s[1] = 10.divmod(M) # 10 ** 1 = 10
a11s[1] = plus(a11s[0], a10s[1])
(2..30).each do |i|
  a10s[i] = multi(a10s[i - 1], a10s[i - 1])
  a11s[i] = plus(a11s[i - 1], multi(a11s[i - 1], a10s[i]))
end

pp(a10s:, a11s:) if $debug
a10s.each.with_index do |x, i|
  pp(i:, x:, x_int: to_M_int(x))
end if $debug
a11s.each.with_index do |x, i|
  pp(i:, x:, x_int: to_M_int(x))
end if $debug

d = 1.divmod(M)
r = 0.divmod(M)
CLS.reverse.each do |c, l|
  pp(c:, l:) if $debug
  r10, r11 = l_to_r(l, a10s, a11s)
  pp(r10:, r11:) if $debug
  r = plus(r, multi(multi(r11, c.divmod(M)), d))
  d = multi(d, r10)
  pp(r:, r_int: to_M_int(r), d:, d_int: to_M_int(d)) if $debug
end

pp(r:) if $debug

puts r[0]

