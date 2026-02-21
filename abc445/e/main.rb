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


def create_spf
  spf = (0..(10 ** 7)).to_a

  n = 10 ** 7
  n2 = Math.sqrt(n).to_i

  (2..n2).each do |i|
    if spf[i] == i
      (i..n).step(i) do |j|
        spf[j] = i
      end
    end
  end
  spf
end

spf = create_spf
pp(spf:) if $debug



# def from_prime_division(ls)
#   r = 1
#   ls.map do |p, i|
#     r *= p.pow(i, M)
#     r %= M
#   end
#   r
# end

def div_mod(x)
  x.pow(M - 2, M)
end

def calc()
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)
  pp(n:, as:) if $debug

  
  ls = []
  l = 1
  as.each do |a|
    ls << l
    x = l.gcd(a)
    l = (l * a * div_mod(x)) % M
  end

  rs = []
  r = 1
  as.reverse.each do |a|
    rs << r
    x = r.gcd(a)
    r = (r * a * div_mod(x)) % M
  end
  rs = rs.reverse

  pp(ls:) if $debug
  pp(rs:) if $debug

  n.times.map do |i|
    ls[i].lcm(rs[i]) % M
    l = ls[i]
    r = rs[i]
    x = l.gcd(r)
    (l * r * div_mod(x)) % M
  end
end



T.times do
  ans = calc()
  puts ans.join(' ')
end

