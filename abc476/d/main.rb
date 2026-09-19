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

N, M, K = STDIN.gets.chomp.split.map(&:to_i)
X, Y = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
BS = STDIN.gets.chomp.split.map(&:to_i)

pp(N:, M:, K:) if $debug
pp(X:, Y:) if $debug
pp(AS:, BS:) if $debug

def calc_b(bs)
  y = Y
  x = X

  jxs = [] # bの購入数と残額
  jxs << [0, x + y * K]

  bs.each.with_index do |b, i|
    pp(b:, i:) if $debug
    b0 = b % K
    b1 = b / K
    b1 += 1 unless b0 == 0
    pp(b0:, b1:) if $debug

    if b1 <= y
      # r += 1
      y -= b1
      x += K - b0 if b0 != 0 # お釣り
      jxs << [i + 1, x + y * K]
    else
      return jxs
    end
  end

  jxs # かえるだけbを買った
end

def calc_a(as, bs, jxs)
  
  rs = []

  # a_sum = 0
  # i0 = 0 # 全部aを買った場合
  # as.each.with_index do |a, i|
  #   if x0 < a + a_sum
  #     i0 = i
  #     break
  #   end
  #   a_sum += a
  # end

  # rs << i0

  # if jxs.length == 1
  #   return i0
  # end

  ia = 0 # aの個数
  xa = 0 # aに使う金額

  jxs.reverse.each do |j, x|
    while ia < N && xa + as[ia] <= x
      xa += as[ia]
      ia += 1
    end

    rs << j + ia
  end

  rs
end

def calc()
  as = AS.sort
  bs = BS.sort
  jxs = calc_b(bs)
  pp(method: 'calc_b', jxs:) if $debug
  rs = calc_a(as, bs, jxs)
  pp(method: 'calc_a', rs:) if $debug
  
  rs.max
end




puts calc()

