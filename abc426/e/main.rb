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

T = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end




def d(sx, sy, gx, gy)
  Math.sqrt((gx - sx) ** 2 + (gy - sy) ** 2)
end


def calc_case(tsx, tsy, tgx, tgy, asx, asy, agx, agy)
  pp(tsx:, tsy:, tgx:, tgy:, asx:, asy:, agx:, agy:) if $debug
  d_t = d(tsx, tsy, tgx, tgy)
  d_a = d(asx, asy, agx, agy)

  px = tgx - tsx
  py = tgy - tsy
  qx = agx - asx
  qy = agy - asy

  # 進行方向が同一の場合はスタート地点の距離
  return d(tsx, tsy, asx, asy) if px == qx && py == qy

  s1 = (px - qx) * (tsx - asx) + (py - qy) * (tsy - asy)
  s0 = (px - qx) ** 2 + (py - qy) ** 2

  s = - s1.to_f / s0.to_f
  pp(s1:, s0:, s:) if $debug


  d(tsx + s * px, tsy + s * py, asx + s * qy, asy + s * qy)

end



T.times do
  tsx, tsy, tgx, tgy = STDIN.gets.chomp.split.map(&:to_i)
  asx, asy, agx, agy = STDIN.gets.chomp.split.map(&:to_i)
  puts calc_case(tsx, tsy, tgx, tgy, asx, asy, agx, agy)
end








