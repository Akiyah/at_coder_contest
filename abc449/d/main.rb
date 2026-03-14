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

L, R, D, U = STDIN.gets.chomp.split.map(&:to_i)

# ans = 0
# (L..R).each do |x|
#   (D..U).each do |y|
#     m = [x.abs, y.abs].max
#     ans += 1 if m % 2 == 0
#   end
# end



def calc_2(r, u) # l = 0, d = 0
  r, u = u, r if r < u # -> u <= r


  i = (u / 2) + 1
  r1 = i * 2 * (i * 2 - 1) / 2

  r2 = (u + 1) * ((r / 2 + 1) - (u / 2 + 1))
  ans = r1 + r2
  pp(t: 'calc_2', r:, u:, r1:, r2:, ans:) if $debug
  ans
end


def calc_1(r, d, u) # l = 0
  lines = r / 2 + 1

  ans = 0
  if d <= 0 # 小さいほうが負のとき
    ans = calc_2(r, u) + calc_2(r, -d) - lines
  else
    ans = calc_2(r, u) - calc_2(r, d - 1)
  end
  pp(t: 'calc_1', r:, d:, u:, lines:, ans:) if $debug
  ans
end


def calc(l, r, d, u)
  if r < 0 # どちらも負
    l, r = -r, -l # 反転して両方正にする
  end
  if u < 0 # どちらも負
    d, u = -u, -d # 反転して両方正にする
  end

  lines = 0
  if d <= 0 # 小さいほうが負のとき
    lines = (u / 2) + 1 + ((-d / 2) + 1) - 1
  else
    lines = (u / 2) + 1 - ((d - 1) / 2 + 1)
  end

  ans = 0
  if l <= 0 # 小さいほうが負のとき
    ans = calc_1(r, d, u) + calc_1(-l, d, u) - lines
  else
    ans = calc_1(r, d, u) - calc_1(l - 1, d, u)
  end

  pp(t: 'calc', l:, r:, d:, u:, lines:, ans:) if $debug

  ans
end

ans = calc(L, R, D, U)

puts ans




