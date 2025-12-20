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

N, M = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)


def calc(as, bs)

  s = 0
  ss = [] # M + 1
  ss << s
  bs.each do |b|
    s += b
    ss << s
  end

  j = 0
  r = 0
  as.each do |a|
    while j < M && bs[j] < a
      j += 1
    end

    r0 = 0
    r0 -= ss[j]
    r0 += (ss[M] - ss[j])
    r0 += a * (j * 2 - M)
    r += r0
    r %= MOD
  end

  r
end



puts calc(AS.sort, BS.sort)