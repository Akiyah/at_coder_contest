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
  pp('calc') if $debug
  # bs = []
  bs = AS.map.with_index do |as, i|
    # pp(as:, i:) if $debug
    as.map { |a| [a, i] }
  end.flatten(1)
  bs = bs.sort_by { |a, i| a }.reverse
  # pp(bs:) if $debug

  cs = [6] * N
  c_all = 6.pow(N, MOD)

  c_invs = []
  (1..6).each do |c|
    c_invs[c] = c.pow(MOD - 2, MOD)
  end

  # pp(bs:, cs:, c_all:) if $debug

  r = 0
  x = 0
  bs.each do |a, i|
    pp(x:, a:, i:, r:, c_all:) if $debug
    c = cs[i]
    c_inv = c_invs[c]

    r += a * c_all * c_inv
    r %= MOD

    cs[i] -= 1
    c_all *= c_inv * (c - 1)
    c_all %= MOD
    if cs[i] == 0
      return (r * (6.pow(N, MOD).pow(MOD - 2, MOD))) % MOD
    end
    x += 1
  end

  (r * (6.pow(N, MOD).pow(MOD - 2, MOD))) % MOD
end



puts calc()
