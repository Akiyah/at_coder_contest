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
  inv_6 = 6.pow(MOD - 2, MOD)

  bs = AS.map do |as|
    as.sort
  end.sort_by { |as| as[-1] }.reverse

  pp(AS:, bs:) if $debug

  dp = { 0 => 1 }
  dp_fix = Hash.new(0)
  bs.each do |as|
    dp_new = Hash.new(0)
    dp.each do |k, v|
      if as[-1] < k # 今後asの中にはk以上のものが現れない
        dp_fix[k] = (dp_fix[k] + v) % MOD
      else
        as.each do |a|
          m = [a, k].max
          dp_new[m] = (dp_new[m] + v * inv_6) % MOD
        end
      end
    end
    dp = dp_new
    pp(dp:dp.length, dp_fix:dp_fix.length) if $debug
  end


  r1 = dp.sum do |k, v|
    k * v
  end % MOD
  r2 = dp_fix.sum do |k, v|
    k * v
  end % MOD
  r = (r1 + r2) % MOD
  # b = 6.pow(N, MOD)
  # b_inv = b.pow(MOD - 2, MOD)

  # r = (a * b_inv) % MOD
  pp(r:) if $debug
  r
end



puts calc()
