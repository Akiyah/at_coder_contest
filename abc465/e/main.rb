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


def create_new_b3_b4(y, b3, b4, d, d2)
  if 3 < b3
    return [4, nil]
  end

  b4 = {} unless b4

  b4_new = b4.merge({ y => true })
  b4_new = b4_new.merge({ 0 => true }) if d < d2 - 1

  b3_new = b4_new.length
  if 3 < b3_new
    return [4, nil]
  end

  return [b3_new, b4_new]
end

def create_dps(m)
  # 0:'3'を含むか、1:3で割ったあまり、2:文字種数、3:使用文字(1文字、2文字、3文字、4文字以上はnilにする)
  dps = []
  dp = {}
  dp[[false, 0, 0, {}]] = 1
  dps << dp
  # pp(dps:) if $debug

  (1..m).each do |d2|
    dp_new = {}

    (0...d2).each do |d|
      dp = dps[d]
      dp.each do |(b1, b2, b3, b4), value|
        (1..9).each do |y| # 一番上の桁
          b1_new = b1 || (y == 3)
          b2_new = (b2 + y) % 3
          b3_new, b4_new = create_new_b3_b4(y, b3, b4, d, d2)
          k = [b1_new, b2_new, b3_new, b4_new]
          v = dp_new[k] || 0
          dp_new[k] = (v + value) % MOD
        end
      end
    end

    dps << dp_new
    # pp(dps:) if $debug
  end

  # k = [false, 0, 1, { 0 => true }]
  # dps[1][k] = 1

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
  pp(method: 'calc_one', is:, m:) if $debug
  r = 0
  b10 = is.include?(3)
  b20 = is.sum
  b400 = is.map { |i| [i, true] }.to_h.merge({0 => true})
  (0...m).each do |d|
    dp = dps[d]
    dp.each do |(b1, b2, b3, b4), value|
      c1 = (b10 || b1 ? 1 : 0)
      c2 = ((b20 + b2) % 3 == 0 ? 1 : 0)
      if b4
        b41 = b400.merge(b4)
        b31 = b41.length
        c3 = (((b31 == 3 && b41[0]) || (b31 == 2 && !b41[0])) ? 1 : 0)
      else
        c3 = 0
      end
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
      c2 = ((b20 + b2) % 3 == 0 ? 1 : 0)
      if b4
        b41 = b401.merge(b4)
        b31 = b41.length
        c3 = (b31 == 3 ? 1 : 0)
      else
        c3 = 0
      end
      # pp(d:, b1:, b2:, b3:, b4:, value:, c1:, c2:, c3:) if $debug
      if c1 + c2 + c3 == 1
        r += value
      end
    end
  end
  r
end

def calc(is, dps)
  pp(is:) if $debug

  r = 0
  m = is.length

  [0].each do |d|
    is2 = is[0...d]
    i2 = is[d]
    pp(is2:, i2:) if $debug

    (1...i2).each do |i|
      r += calc_one(is2 + [i], m - d - 1, dps)
      r %= MOD
      pp(r:, d:, is2:, i:, 'm - d - 1' => m - d - 1) if $debug
    end
  end

  (1...m).each do |d|
    is2 = is[0...d]
    i2 = is[d]
    pp(is2:, i2:) if $debug

    (0...i2).each do |i|
      r += calc_one(is2 + [i], m - d - 1, dps)
      r %= MOD
      pp(r:, d:, is2:, i:, 'm - d - 1' => m - d - 1) if $debug
    end
  end

  r += calc_one(is, 0, dps)
  r %= MOD
  pp(r:, is:) if $debug

  if 1 < m
    r += calc_under_m_keta(m - 1, dps) # ex: m = 3 => 1 〜 999
    r %= MOD
    pp(r:, m:) if $debug
  end

  r
end

is = N.chars.map(&:to_i)

dps = create_dps(is.length)
pp(dps:) if $debug

puts calc(is, dps)


