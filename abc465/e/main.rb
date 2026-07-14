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

N = STDIN.gets.chomp

def create_dps(m)
  # 0:'3'を含むか、1:3で割ったあまり、2:文字種数、3:使用文字(1文字、2文字、3文字、4文字以上はnilにする)
  dps = []
  dp = {}
  dp[[true, 0, 0, {}]] = 0
  dp[[true, 1, 0, {}]] = 0
  dp[[true, 2, 0, {}]] = 0
  dp[[false, 0, 0, {}]] = 1
  dp[[false, 1, 0, {}]] = 0
  dp[[false, 2, 0, {}]] = 0
  dps << dp
  pp(dps:) if $debug

  (1..m).each do |d_new|
    dp_new = {}

    dps.each.with_index do |dp, d|
      dp.each do |(b1, b2, b3, b4), value|
        (1..9).each do |y| # 一番上の桁
          b1_new = b1 || (y == 3)
          b2_new = (b2 + y) % 3
          if b3 < 3 && b4 && !b4[y]
            b3_new = b3 + 1
            b4_new = b4.merge({ y => true })
          else
            b3_new = b3
            b4_new = b4
          end
          k = [b1_new, b2_new, b3_new, b4_new]
          v = dp_new[k] || 0
          dp_new[k] = (v + value) % MOD
        end
      end
    end
    dps << dp_new
    pp(dps:) if $debug
  end
  dps
end


def calc_under_m_keta(m, dps) # ex: m = 3 => 1 〜 999
  r = 0
  (1..m).each do |d|
    dp = dps[d]
    dp.each do |(b1, b2, b3, b4), value|
      c1 = (b1 ? 1 : 0)
      c2 = (b2 == 0 ? 1 : 0)
      c3 = (b3 == 3 ? 1 : 0)
      if c1 + c2 + c3 == 1
        r += value
      end
    end
  end
  r
end

def calc_one(is, m, dps) # ex: is = [1, 2], m = 3 => 12000 〜 12999
  r = 0
  b10 = is.include?(3)
  b20 = is.sum
  b400 = is.map { |i| [i, true] }.to_h.merge({0 => true})
  (1...m).each do |d|
    dp = dps[d]
    dp.each do |(b1, b2, b3, b4), value|
      c1 = (b10 || b1 ? 1 : 0)
      c2 = ((b20 + b2) == 0 ? 1 : 0)
      b41 = b400.merge(b4)
      b31 = b41.length
      c3 = (((b31 == 3 && b41[0]) || (b31 == 2 && !b41[0])) ? 1 : 0)
      if c1 + c2 + c3 == 1
        r += value
      end
    end
  end
  b401 = is.map { |i| [i, true] }.to_h
  [m].each do |d|
    dp = dps[d]
    dp.each do |(b1, b2, b3, b4), value|
      c1 = (b10 || b1 ? 1 : 0)
      c2 = ((b20 + b2) == 0 ? 1 : 0)
      b41 = b401.merge(b4)
      b31 = b41.length
      c3 = (b31 == 3 ? 1 : 0)
      if c1 + c2 + c3 == 1
        r += value
      end
    end
  end
  r
end

def calc(is, dps)
  r = 0
  m = is.length

  (1...m).each do |d|
    is2 = is[0...d]
    i2 = is[d]

    (0...i2).each do |i|
      r += calc_one(is2 + [i], m - d, dps)
      r %= MOD
    end
  end

  [0].each do |d|
    i2 = is[0]

    (1...i2).each do |i| # 0 は含まない
      r += calc_one([i], 0, dps)
      r %= MOD
    end
  end

  if 1 < m
    r += calc_under_m_keta(m - 1, dps) # ex: m = 3 => 1 〜 999
  end
  r %= MOD

  r
end

is = N.chars.map(&:to_i)

dps = create_dps(is.length)
pp(dps:) if $debug

puts calc(is, dps)


