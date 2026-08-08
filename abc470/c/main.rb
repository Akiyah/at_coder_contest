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
as = {}
bottom = 0
ks = {}
pp(b:, as:, ks:) if $debug

Q.times do |q|
  t, x1 = STDIN.gets.chomp.split.map(&:to_i)
  pp(t:, x1:) if $debug
  if t == 1
    x = x1 - 1
    a = if !as[x] || as[x] <= bottom
      bottom
    else
      as[x]
    end

    as[x] = a + 1

    if ks[a] # 1
      ks.delete(a)
    else
      ks[a] = 1
    end

    if ks[a + 1] # 1
      ks.delete(a + 1)
    else
      ks[a + 1] = 1
    end

    b ^= a
    b ^= (a + 1)
  else # t == 2
    ks.delete(bottom) if ks[bottom]
    bottom += 1

    b = 0
    ks.each do |k, v|
      b ^= (1 << (k - bottom - 1))
    end
  end

  pp(b:, as:, ks:) if $debug

  puts b
end
