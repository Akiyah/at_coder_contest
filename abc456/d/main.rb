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

S = STDIN.gets.chomp

MOD = 998244353

def calc
  ss = S.chars

  last_s = nil
  hs = []
  ss.each do |s|
    if s == last_s
      hs[-1][1] += 1
    else
      hs << [s, 1]
    end
    last_s = s
  end

  pp(ss:, hs:) if $debug


  dp = {} # 最後がsで終わる、連続していない部分文字列
  dp['a'] = 0
  dp['b'] = 0
  dp['c'] = 0
  r = 0
  pp(dp:) if $debug
  hs.each do |s, i|
    da = 0
    db = 0
    dc = 0
    if s == 'a'
      da = (dp['b'] + dp['c'] + 1) * i
    end
    if s == 'b'
      db = (dp['a'] + dp['c'] + 1) * i
    end
    if s == 'c'
      dc = (dp['a'] + dp['b'] + 1) * i
    end

    r += da + db + dc
    r %= MOD
    dp['a'] += da
    dp['a'] %= MOD
    dp['b'] += db
    dp['b'] %= MOD
    dp['c'] += dc
    dp['c'] %= MOD

    pp(s:, i:, r:, dp:) if $debug
  end

  r %= MOD
  r
end


puts calc


