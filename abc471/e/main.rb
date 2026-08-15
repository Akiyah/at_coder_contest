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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

pp(N:, K:, AS:) if $debug

$factorial = [1]
(1..N).each do |i|
  $factorial[i] = (i * $factorial[i - 1]) % MOD
end
pp(factorial: $factorial) if $debug

def inv(n)
  n.pow(MOD - 2, MOD) 
end

def c(n, k)
  return 0 if n <= 0
  return 0 if k < 0
  $factorial[n] * inv($factorial[k]) * inv($factorial[n - k]) % MOD
end

def calc
  s1 = AS.sum % MOD
  s2 = AS.map { |a| a ** 2 % MOD }.sum % MOD

  s12 = (s1 ** 2 - s2) # 2 * a1 * a2 の形の総和
  pp(s1:, s2:, s12:) if $debug

  pp(cNK: c(N, K)) if $debug
  pp(cN_K: c(N - 1, K)) if $debug
  pp(cN__K__: c(N - 2, K - 2)) if $debug

  r = 0
  r += s2 * (c(N, K) - c(N - 1, K))
  r += s12 * c(N - 2, K - 2)

  r % MOD
end

puts calc % MOD


