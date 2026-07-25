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
AS = STDIN.gets.chomp.split.map(&:to_i)
MOD = 998244353

def f(l, r)
  q = (r - l + 1).pow(MOD - 2, MOD)
  AS[l..r].sum * q
end


ans = 0
N.times do |l|
  (l...N).each do |r|
    x = f(l, r)
    pp(l:, r:, x:) if $debug
    ans += x
    ans %= MOD
  end
end

puts ans







