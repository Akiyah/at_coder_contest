#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


require "ac-library-rb/priority_queue"
require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def check(n, bs, i)
  # pp 'check'
  r = 0
  (2 * n).times do |j|
    if bs[-(j + 1)] || j == 2 * n - 1 - i
      r += 1
    else
      r -= 1
    end
    # pp(i:, j:, r:)
    return false if 0 < r
  end
  true
end

def calc(n, as)
  # ( : [1, 1]
  # ) : [0, 1]
  # segtree = AcLibraryRb::Segtree.new(2 * n, [0, 1]) do |(s1, d1), (s2, d2)|
  #   [s1 + s2, d1 + d2]
  # end

  bs = Array.new(2 * n, false)
  ais = as.zip(0...(2 * n)).sort_by { |a, i| a }.reverse

  pp(n:, as:, ais:) if $debug

  co = 0
  r = 0

  ais.each do |a, i|
    # segtree.set(2 * n - i - 1, [1, 1])
    # x = segtree.max_right(0) { |s, d| s * 2 <= d }
    pp(a:, i:, r:, co:, bs:) if $debug
    if check(n, bs, i)
      co += 1
      r += a
      bs[i] = true
      pp(a:, i:, r:, co:, bs:) if $debug
      return r if co == n
    else
    end
  end
  pp 'end'
end


T.times do |t|
  n = STDIN.gets.chomp.to_i
  as = (2 * n).times.map do
    STDIN.gets.chomp.to_i
  end
  pp(t:, n:, as:) if $debug
  puts calc(n, as)
end


