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

T, M = STDIN.gets.chomp.split.map(&:to_i)


def inv_mod(x, m)
  z = _inv_gcd(x, m)
  pp(x:, m:, z:) if $debug
  raise ArgumentError unless z.first == 1

  z[1]
end

def _inv_gcd(a, b)
  a %= b # safe_mod

  s, t = b, a
  m0, m1 = 0, 1

  while t > 0
    u = s / t
    s -= t * u
    m0 -= m1 * u

    s, t = t, s
    m0, m1 = m1, m0
  end

  m0 += b / s if m0 < 0
  [s, m0]
end

$f = { 0 => 1 }
$max_f = 0
def factorial(n)
  return $f[n] if $f[n]

  pp(name: 'factorial', n:) if $debug

  (($max_f + 1)..n).each do |i|
    $f[i] = (i * factorial(i - 1)) #  % M
  end
  $max_f = n

  $f[n]
end

def combi(n, r)
  pp(name: 'combi', n:, r:) if $debug
  factorial(n) / factorial(n - r) / factorial(r)
  factorial(n) * inv_mod(factorial(n - r), M) * inv_mod(factorial(r), M)
end


def calc(n, cs)
  pp(name: 'calc', n:, cs:) if $debug
  r = 1
  s = 0
  cs.each_with_index do |c, i|
    r *= (combi(s + c, c))
    r %= M
    s += c    
    pp(name: 'calc', c:, i:, r:, s:) if $debug
  end
  r % M
end


T.times do
  n = STDIN.gets.chomp.to_i
  cs = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, cs)
end

