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



def calc(px, py, qx, qy, rx, ry, sx, sy)
  unless (px - qx) * (ry - sy) == (py - qy) * (rx - sx) # 並行
    pp(1) if $debug
    return true
  end

  # 平行な場合
  if ry - sy != 0
    if ((px**2 - qx**2) + (py**2 - qy**2)) * (ry - sy) == ((rx**2 - sx**2) + (ry**2 - sy**2)) * (py - qy) # y切片が同じ
      pp(2) if $debug
      return true
    end
  end

  if rx - sx != 0
    if ((py**2 - qy**2) + (px**2 - qx**2)) * (rx - sx) == ((ry**2 - sy**2) + (rx**2 - sx**2)) * (px - qx) # x切片が同じ
      pp(3) if $debug
      return true
    end
  end





  pp(4) if $debug

  false
end




T.times do
  px, py, qx, qy, rx, ry, sx, sy = STDIN.gets.chomp.split.map(&:to_i)
  r = calc(px, py, qx, qy, rx, ry, sx, sy)
  puts r ? 'Yes' : 'No'
end


