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

N, Q = STDIN.gets.chomp.split.map(&:to_i)


b = 0
as = Array.new(N, 0)
bottom = 0
ks = {}
pp(b:, as:, ks:, bottom:) if $debug

Q.times do |q|
  t, x1 = STDIN.gets.chomp.split.map(&:to_i)
  pp(t:, x1:) if $debug
  if t == 1
    x = x1 - 1
    a = as[x]
    a = bottom if a < bottom

    as[x] = a + 1

    ks[a] = ((ks[a] || 0) - 1) % 2
    ks[a + 1] = ((ks[a + 1] || 0) + 1) % 2

    b ^= (a - bottom)
    b ^= (a - bottom + 1)
  else # t == 2
    ks.delete(bottom) if ks[bottom]
    bottom += 1

    ks_new = {}
    ks.each do |k, v|
      next if k <= bottom
      ks_new[k] = 1 unless v % 2 == 0
    end
    ks = ks_new

    b = 0
    ks.each do |k, v|
      b ^= (k - bottom)
    end

  end

  pp(b:, as:, ks:, bottom:) if $debug

  puts b
end
