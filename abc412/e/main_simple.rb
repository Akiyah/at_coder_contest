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

# inv_mod := x.pow(MOD - 2, MOD)

N = STDIN.gets.chomp.to_i
AS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc()
  
  dp = { 0 => 1 }
  AS.each do |as|
    dp_new = Hash.new(0)
    as.each do |a|
      dp.each do |k, v|
        m = [a, k].max
        dp_new[m] += v
      end
    end
    dp = dp_new
  end

  pp dp if $debug

  a = dp.sum do |k, v|
    k * v
  end
  b = 6.pow(N, MOD)
  b_inv = b.pow(MOD - 2, MOD)

  r = (a * b_inv) % MOD
  pp(a:, b:, b_inv:, r:) if $debug
  r
end



puts calc()
