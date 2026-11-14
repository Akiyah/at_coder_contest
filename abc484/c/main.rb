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

N = STDIN.gets.chomp.to_i
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)



def search(as, bs)
  N.times do |i|
    return i if as[i] != bs[i]
  end
end

def search_r(as, bs)
  N.times do |i|
    return i if as[N - 1 - i] != bs[N - 1 - i]
  end
end

def calc(as, bs)
  pp(as:, bs:) if $debug

  if as == bs
    return true
  end

  i1 = search(as, bs)
  j2 = search_r(as, bs)

  i2 = N - 1 - j2

  return false if i1 == i2


  as2 = as[i1..i2]
  bs2 = bs[i1..i2]
  pp(i1:, j2:, i2:) if $debug
  pp(as2:, bs2:) if $debug

  pp(as2[1..], bs2[...(-1)], as[0], bs[-1]) if $debug
  pp(bs2[1..], as2[...(-1)], bs[0], as[-1]) if $debug

  if as2[1..] == bs2[...(-1)] && as2[0] == bs2[-1]
    return true
  end
  if bs2[1..] == as2[...(-1)] && bs2[0] == as2[-1]
    return true
  end

  false
end



r1 = calc(AS, BS)

puts r1 ? 'Yes' : 'No'
