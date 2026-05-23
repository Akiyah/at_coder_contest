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

MOD = 998244353

X1, X2, X3 = STDIN.gets.chomp.split.map(&:to_i)

$factorial_i = 0
$factorial_data = [1]
def factorial(n)
  if $factorial_i < n
    x = $factorial_data[$factorial_i]
    (($factorial_i + 1)..n).each do |i|
      x *= i
      x %= MOD
      $factorial_data[i] = x
    end
    $factorial_i = n
  end

  $factorial_data[n]
end

def inverse(n)
  n.pow(MOD - 2, MOD)
end

def combination(n, m)
  a1 = factorial(n)
  a2 = factorial(m)
  a3 = factorial(n - m)
  ans = a1 * inverse(a2 * a3) % MOD
  pp("combination(#{n}, #{m}) = #{ans}") if $debug
  ans
end

r = 0
(1..X2).each do |i|
  next unless 0 <= X1 - i

  pp(i:) if $debug
  r1 = combination(X1 - 1, i - 1)
  r2 = combination(X2 + 1, i)
  r3 = combination(X2 + 1 - i + X3 - 1, X3)
  pp(i:, r1:, r2:, r3:, 'r1 * r2 * r3' => r1 * r2 * r3 ) if $debug
  r += r1 * r2 * r3
  r %= MOD
end

puts r

