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

A, B, C, D = STDIN.gets.chomp.split.map(&:to_i)

MOD = 998244353

FACT = [1]
FACT_ = [1]
m = [A, B, C, D].max
(1..m).each do |i|
  FACT[i] = (i * FACT[i - 1]) % MOD
  FACT_[i] = FACT[i].pow(MOD - 2, MOD)
end
$f_count = m

def factorial(n)
  return FACT[n] if n <= $f_count

  (($f_count + 1)..n).each do |i|
    FACT[i] = (i * FACT[i - 1]) % MOD
    FACT_[i] = FACT[i].pow(MOD - 2, MOD)
  end

  $f_count = n
  FACT[n]
end

def factorial_(n)
  return FACT_[n] if n <= $f_count

  (($f_count + 1)..n).each do |i|
    FACT[i] = (i * FACT[i - 1]) % MOD
    FACT_[i] = FACT[i].pow(MOD - 2, MOD)
  end

  $f_count = n
  FACT_[n]
end

def calc
  (0..C).map do |i|
    pp({i:}) if $debug

    a1 = factorial(D - 1 + C - i)
    a2_ = factorial_(D - 1)
    a3_ = factorial_(C - i)
    pp({a1:, a2_:, a3_:}) if $debug

    b1 = factorial(A + i + B)
    b2_ = factorial_(A + i)
    b3_ = factorial_(B)
    pp({b1:, b2_:, b3_:}) if $debug

    s = a1 * a2_ * a3_ * b1 * b2_ * b3_
    pp({s:}) if $debug
    s % MOD
  end.sum % MOD
end

puts calc

