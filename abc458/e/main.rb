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

def factorial(n)
  return 1 unless 1 < n
  n * factorial(n - 1)  
end


def c(n, m)
  factorial(n) / factorial(m) / factorial(n - m)
end

r = 0
(1..X2).each do |i|
  j = (X2 + 1) - i
  pp(i:) if $debug
  pp(j:) if $debug
  pp(c(X1, i)) if $debug
  pp(c(X3 + j, j)) if $debug
  pp(c(X2 + 1, i)) if $debug
  c(X1 + i, i) * c(X3 + j, j) * c(X2 + 1, i)
  r += c(X1, i) * c(X3 + j, j) * c(X2 + 1, i)
end

puts r

