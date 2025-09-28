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

T, M = STDIN.gets.chomp.split.map(&:to_i)



$combi = []
(1..5000).each do |n|
  $combi[n] = []
  $combi[n][0] = 1
end

$combi[1][1] = 1

(2..5000).each do |n|
  # pp(n:) if $debug
  # $combi[n] = []
  # # r == 1
  # $combi[n][1] = $combi[n - 1][1] * (n + 1) / n

  # 0 < r
  (1..(n / 2)).each do |r|
    r2 = (r <= (n - 1) / 2 ? r : n - 1 - r)
    # pp(n:, r:, r2:, combi: $combi[n - 1]) if $debug
    $combi[n][r] = ($combi[n - 1][r - 1] + $combi[n - 1][r2]) % M
  end
end

def combi(n, r)
  r = n - r unless r <= n / 2
  $combi[n][r]
end


def calc(n, cs)
  pp(name: 'calc', n:, cs:) if $debug
  r = 1
  s = 0
  cs.each_with_index do |c, i|
    r *= (combi(s + c, c))
    r %= M
    s += c
    pp(name: 'calc', c:, i:, r:, s:) if $debug
  end
  r % M
end


T.times do
  n = STDIN.gets.chomp.to_i
  cs = STDIN.gets.chomp.split.map(&:to_i)
  puts calc(n, cs)
end

