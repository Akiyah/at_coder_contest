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

MOD = 998244353
T = STDIN.gets.chomp.to_i


a_pds = []
(1..18).each do |dy| # yの桁数
  a = (10 ** dy) - 1
  a_pds[dy] = Prime.prime_division(a).to_h
end

def calc(n, m, a_pds)

  m_pd = Prime.prime_division(m).to_h

  ans = 0
  (1..18).each do |dy| # yの桁数
    r = 0
    y1 = 10 ** (dy - 1)
    y2 = 10 ** (dy) - 1
    pp(dy:, y1:, y2:, n:, m:) if $debug
    next if n < y1

    # pd = Prime.prime_division(a)
    # m_pd = Prime.prime_division(m)
    a_pd = a_pds[dy]

    b_pd = {}
    m_pd.each do |p, d|
      if (a_pd[p] || 0) < d
        b_pd[p] = d - (a_pd[p] || 0)
      end
    end

    pp(m_pd:, a_pd:, b_pd:) if $debug

    b = Integer.from_prime_division(b_pd)
    pp(m:, b:) if $debug



    # (1..n).each do |x|
    #   r += 1 if (x * (10 ** dy) - x) % m == 0
    # end
    r += n / b

    pp(r:, y_: ([y2, n].min - y1 + 1)) if $debug

    ans += ([y2, n].min - y1 + 1) * r
    ans %= MOD
  end

  ans % MOD
end


T.times do
  n, m = STDIN.gets.chomp.split.map(&:to_i)
  ans = calc(n, m, a_pds)
  puts ans
end


