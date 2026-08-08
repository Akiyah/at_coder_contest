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
ks = {}
ks[0] = N
pp(b:, as:, ks:) if $debug

Q.times do |q|
  t, x1 = STDIN.gets.chomp.split.map(&:to_i)
  pp(t:, x1:) if $debug
  if t == 1
    x = x1 - 1
    a = as[x] || 0
    as[x] = a + 1

    if ks[a]
      ks[a] -= 1
      ks.delete(a) if ks[a] == 0
    end

    ks[a + 1] ||= 0
    ks[a + 1] += 1

    b ^= a
    b ^= (a + 1)
  else # t == 2
    new_as = {}
    as.each do |a, v|
      new_as[a] = v - 1 if 1 < v # 0は含まないようにする
    end
    as = new_as

    new_ks = {}
    ks.each do |k, v|
      new_ks[k - 1] = v if 0 < k
    end
    new_ks[0] ||= 0
    new_ks[0] += ks[0] || 0
    ks = new_ks
    b = 0
    ks.each do |k, v|
      if 0 < k
        b ^= (1 << (k - 1)) unless v % 2 == 0
      end
    end
  end

  pp(b:, as:, ks:) if $debug

  puts b
end
