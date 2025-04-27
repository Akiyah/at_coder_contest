#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/dsu"

dsu = AcLibraryRb::DSU.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, D = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)

as = AS.tally
pp as if $debug

if D == 0
  r = as.map do |a, v|
    v - 1
  end.sum
  puts r
  exit
end

# 0 < D

ks = as.keys.sort
pp ks if $debug

ms = {}
gs = {}
ks.each do |k|
  gs[k % D] ||= []
  if as[k - D]
    gs[k % D][-1] << k
  else
    gs[k % D] << []
    gs[k % D][-1] << k
  end
end

pp gs if $debug


def calc(gs, as)
  pp [gs, as] if $debug
  return 0 if gs.length == 1

  dp = { true => 0, false => 0} # 残す、残さない
  pp dp if $debug
  gs.each do |g|
    dp_new = {}
    dp_new[true] = dp[false] # 残す
    dp_new[false] = [dp[true], dp[false]].min + as[g] # 残さない
    dp = dp_new
    pp dp if $debug
  end
  [dp[true], dp[false]].min
end

r = 0
gs.each do |k, gs2|
  gs2.each do |gs3|
    r += calc(gs3, as)
  end
end


puts r
