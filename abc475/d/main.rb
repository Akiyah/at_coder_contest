#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

S = STDIN.gets.chomp
pp(S:) if $debug

def check(cs, l, prime)
  return false unless 10 ** (l - 1) <=  prime and prime < 10 ** l

  s2 = prime.to_s.chars

  pp(prime:, s2:) if $debug

  scis2 = {}
  cs.each do |c, is|
    pp(c:, is:) if $debug
    scis = is.map do |i|
      s2[i]
    end.uniq
    pp(scis:) if $debug

    if 1 < scis.length
      return false
    end
    if scis2[c]
      return false
    end
    scis2[scis[0]] = true
    pp(scis2:) if $debug
  end


  unless scis2.uniq.length == cs.length
    return false
  end

  return true
end

def calc

  cs = {}
  S.chars.each.with_index do |c, i|
    cs[c] ||= []
    cs[c] << i
  end
  pp(cs:) if $debug
  pp(cs.length) if $debug

  l = S.length
  Prime.each(10000000) do |prime|
    r = check(cs, l, prime)
    return prime if r
  end

  -1
end



puts calc
