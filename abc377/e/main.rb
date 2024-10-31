#!/usr/bin/env ruby

require 'prime'

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

N, K = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)
ps = PS.map { |p| p - 1 }
pp ps if $debug

dsu = AcLibraryRb::DSU.new(N)
ps.each_with_index do |p, i|
  dsu.merge(p, i)
end
pp dsu.groups if $debug

def calc_count(k, m) # 2とmは互いに素
  # (2 ** k) % m
  # pp "calc_count(#{m}, #{k})"
  return 0 if m == 1

  # ms = m.prime_division.to_h
  ms = m.prime_division.to_h
  if ms[2]
    if k < ms[2]
      2 ** k
    else
      calc_count(k - ms[2], m / (2 ** ms[2])) * (2 ** ms[2])
    end
  else
    # オイラー関数
    f = ms.map { |p, i| (p - 1) * p ** (i - 1) }.inject(:*)
    # pp f
    (2 ** (k % f)) % m
  end
end

def calc_one(h)
  k = calc_count(K, h.length)

  f = h.keys.first
  j = f
  k.times do
    j = h[j]
  end

  h_new = {}
  i = f
  h.length.times do
    h_new[i] = j
    i = h[i]
    j = h[j]
  end

  h_new
end


def calc(ps, dsu)
  r = {}
  dsu.groups.each do |group|
    # pp group
    h = group.map { |i| [i, ps[i]] }.to_h
    # pp h
    r2 = calc_one(h)
    # pp r2
    r.merge!(r2)
  end

  pp r if $debug
  r.to_a.sort.map { |i, p| p }
end

rs = calc(ps, dsu)

puts rs.map { |r| r + 1 }.join(' ')
