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



a_pds = [
  nil,
  {3 => 2},
  {3 => 2, 11 => 1},
  {3 => 3, 37 => 1},
  {3 => 2, 11 => 1, 101 => 1},
  {3 => 2, 41 => 1, 271 => 1},
  {3 => 3, 7 => 1, 11 => 1, 13 => 1, 37 => 1},
  {3 => 2, 239 => 1, 4649 => 1},
  {3 => 2, 11 => 1, 73 => 1, 101 => 1, 137 => 1},
  {3 => 4, 37 => 1, 333667 => 1},
  {3 => 2, 11 => 1, 41 => 1, 271 => 1, 9091 => 1},
  {3 => 2, 21649 => 1, 513239 => 1},
  {3 => 3, 7 => 1, 11 => 1, 13 => 1, 37 => 1, 101 => 1, 9901 => 1},
  {3 => 2, 53 => 1, 79 => 1, 265371653 => 1},
  {3 => 2, 11 => 1, 239 => 1, 4649 => 1, 909091 => 1},
  {3 => 3, 31 => 1, 37 => 1, 41 => 1, 271 => 1, 2906161 => 1},
  {3 => 2, 11 => 1, 17 => 1, 73 => 1, 101 => 1, 137 => 1, 5882353 => 1},
  {3 => 2, 2071723 => 1, 5363222357 => 1},
  {3 => 4, 7 => 1, 11 => 1, 13 => 1, 19 => 1, 37 => 1, 52579 => 1, 333667 => 1},
  {3 => 2, 1111111111111111111 => 1}
]

# a_pds = []
# (1..19).each do |dy| # yの桁数
#   pp(dy:) if $debug
#   a = (10 ** dy) - 1
#   a_pds[dy] = Prime.prime_division(a).to_h
#   pp(a_pds:) if $debug
# end

def calc(n, m, a_pds)

  m_pd = Prime.prime_division(m).to_h

  ans = 0
  (1..19).each do |dy| # yの桁数
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


