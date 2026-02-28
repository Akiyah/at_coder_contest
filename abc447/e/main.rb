#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

MOD = 998244353

N, M = STDIN.gets.chomp.split.map(&:to_i)
UVS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


pp(N:, M:) if $debug
pp(UVS:) if $debug


# paths = {}
# UVS.each do |u, v|
#   paths[u] ||= []
#   paths[u] << v
#   paths[v] ||= []
#   paths[v] << u
# end




def calc
  dsu = AcLibraryRb::DSU.new(N)

  groups_count = N

  is = []
  UVS.reverse.each.with_index do |(u1, v1), ri|
    u = u1 - 1
    v = v1 - 1

    if !dsu.same?(u, v)
      if 2 < groups_count
        dsu.merge(u, v)
        groups_count -= 1
      else
        is << M - ri
      end
    end
  end

  pp(is:) if $debug

  r = 0
  is.each do |i|
    r += 2.pow(i, MOD)
    r %= MOD
  end
  r 
end



puts calc







