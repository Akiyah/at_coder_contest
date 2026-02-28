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

M = 998244353

T = STDIN.gets.chomp.to_i

# # 線形篩
# $lpf = (0..(10 ** 7)).to_a
# primes = []
# (2..(10 ** 7)).each do |x|
#   primes << x if $lpf[x] == x
#   primes.each do |p|
#     break if 10 ** 7 < p * x || $lpf[x] < p
#     $lpf[p * x] = p
#   end
# end

$spf = (0..(10 ** 7)).to_a
(2..Math.sqrt(10 ** 7)).each do |i|
  # pp(i:, spf: $spf[..20]) if $debug && i <= 20
  if $spf[i] == i
    ((i * i)..(10 ** 7)).step(i) do |j|
      $spf[j] = i if $spf[j] == j
    end
  end
end

# unless $lpf == $spf
#   pp($lpf[..20])
#   pp($spf[..20])
# end



def calc(n, as)
  e1 = {}
  e2 = {}
  as.each do |a|
    x = a
    while 1 < x
      p = $spf[x]
      e = 0
      while x % p == 0
        x /= p
        e += 1
      end
      if !e1[p] || e1[p] < e
        e2[p] = e1[p]
        e1[p] = e
      elsif !e2[p] || e2[p] < e
        e2[p] = e
      end
    end
  end

  lcm = 1
  e1.each do |p, e|
    lcm *= p.pow(e, M)
    lcm %= M
  end


  as.map do |a|
    x = a
    ans = lcm
    while 1 < x
      p = $spf[x]
      e = 0
      while x % p == 0
        x /= p
        e += 1
      end

      if e == e1[p]
        d = p.pow(e1[p] - (e2[p] || 0), M)
        ans *= d.pow(M - 2, M)
        ans %= M
      end
    end
    ans % M
  end
end

T.times do
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)
  ans = calc(n, as)
  puts ans.join(' ')
end

