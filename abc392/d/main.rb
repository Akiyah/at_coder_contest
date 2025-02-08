#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N = STDIN.gets.chomp.to_i
KAS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp N if $debug
pp KAS if $debug

$kas = KAS.map do |k, *as|
  cs = as.group_by { |a| a}.transform_values { |vs| vs.length }
  [k, cs.keys.sort, cs]
end

pp $kas if $debug


def calc(i, j)
  k1, bs1, cs1 = $kas[i - 1]
  k2, bs2, cs2 = $kas[j - 1]

  pp [i, j, [k1, bs1, cs1], [k2, bs2, cs2]] if $debug

  x1 = 0
  x2 = 0

  r = 0
  while x1 < bs1.length && x2 < bs2.length
    pp ({x1:, x2:}) if $debug
    b1 = bs1[x1]
    b2 = bs2[x2]
    pp [b1, b2] if $debug
    r += (cs1[b1] * cs2[b2]) if b1 == b2
    if b2 <= b1
      x2 += 1
    else
      x1 += 1
    end
  end

  pp({i:, j:, r:, k1:, k2:, return: r.to_f / (k1 * k2)}) if $debug
  r.to_f / (k1 * k2)
end



rs = (1..N).to_a.combination(2).map do |i, j|
  [calc(i, j), i, j]
end

pp rs if $debug

puts rs.map{|r, i, j| r}.max

