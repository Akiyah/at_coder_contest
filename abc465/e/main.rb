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


$data
def set(dp, p3, c, b, edge, count)
  dp[p3] ||= []
  dp[p3][c] ||= []
  dp[p3][c][b] ||= {}
  dp[p3][c][b][edge] += count
end

def get(dp, p3, c, b, edge)
  dp[p3] ||= []
  dp[p3][c] ||= []
  dp[p3][c][b] ||= {}
  dp[p3][c][b][edge] += count
end

# p3: 3で割ったあまり、0,1,2
# c: 使用文字種数、0,1,2,3,4,5,6,7,8,9,10
# b: 使用文字種、0b0000000000〜0b1111111111、4文字種以上は0x1111111111に寄せる
def key(p3, c, b)
  (p3 * 11 + c) * 0b10000000000 + b
end

def parse_key(k)
  p3 = k / (11 * 0b10000000000)
  c = (k / 0b10000000000) % 11
  b = k % 0b10000000000
  [p3, c, b]
end

def next_p3_c_b(p3, c, b, n2)
  # pp(method: 'next_p3_c_b', p3:, c:, b:, n2:) if $debug
  p3_new = (p3 + n2) % 3
  c_new = b[n2] == 1 ? c : c + 1
  b_new = b | (1 << n2)
  # if 3 < c_new
  #   return [p3_new, 4, 0b1111111111]
  # end
  [p3_new, c_new, b_new]
end

def calc()
  ns = N.chars.map(&:to_i)
  m = ns.length

  k0 = key(0, 0, 0b0000000000)
  kvs = Hash.new(0)
  # kvs[k0] = 1

  kvs_edge = Hash.new(0)
  kvs_edge[k0] = 1

  if $debug
    # pp kvs.map { |k, v| p3, c, b = parse_key(k); [[p3, c, b.to_s(2)], v] }
    pp kvs_edge.map { |k, v| p3, c, b = parse_key(k); [[p3, c, b.to_s(2)], v] }
  end

  ns.each.with_index do |n, i|
    kvs_new = Hash.new(0)
    kvs_edge_new = Hash.new(0)

    # この桁からスタートするもの
    if 0 < i
      (1..9).each do |n2| # 0は除外
        p3, c, b = next_p3_c_b(0, 0, 0b0000000000, n2)
        k_new = key(p3, c, b)
        kvs_new[k_new] += 1
      end
    end

    kvs.each do |k, v|
      p3_old, c_old, b_old = parse_key(k)
      (0..9).each do |n2|
        p3, c, b = next_p3_c_b(p3_old, c_old, b_old, n2)
        k_new = key(p3, c, b)
        kvs_new[k_new] = (kvs_new[k_new] + v) % MOD
      end
    end

    kvs_edge.each do |k, v| # 一個だけ入っている
      p3_old, c_old, b_old = parse_key(k)
      range = (i == 0 ? (1...n) : (0...n)) # 一番上の桁は0を除く
      range.each do |n2|
        p3, c, b = next_p3_c_b(p3_old, c_old, b_old, n2)
        k_new = key(p3, c, b)
        kvs_new[k_new] = (kvs_new[k_new] + v) % MOD
      end
      [n].each do |n2|
        p3, c, b = next_p3_c_b(p3_old, c_old, b_old, n2)
        k_new = key(p3, c, b)
        kvs_edge_new[k_new] = (kvs_edge_new[k_new] + v) % MOD
      end
    end

    kvs = kvs_new
    kvs_edge = kvs_edge_new

    if $debug
      # pp kvs.map { |k, v| p3, c, b = parse_key(k); [[p3, c, b.to_s(2)], v] }
      pp kvs_edge.map { |k, v| p3, c, b = parse_key(k); [[p3, c, b.to_s(2)], v] }
    end
  end

  # pp(kvs:) if $debug
  # pp(kvs_edge:) if $debug

  r = 0
  kvs.each do |k, v|
    p3, c, b = parse_key(k)
    d0 = (p3 == 0) ? 1 : 0
    d1 = (b[3] == 1) ? 1 : 0
    d2 = (c == 3) ? 1 : 0
    r = (r + v) % MOD if d0 + d1 + d2 == 1
  end
  kvs_edge.each do |k, v|
    p3, c, b = parse_key(k)
    d0 = (p3 == 0) ? 1 : 0
    d1 = (b[3] == 1) ? 1 : 0
    d2 = (c == 3) ? 1 : 0
    r = (r + v) % MOD if d0 + d1 + d2 == 1
  end

  r
end

puts calc()


