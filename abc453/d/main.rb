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

H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp
end


# 0:U
# 1:D
# 2:R
# 3:L

$d2p = [
  [-1,  0], # U
  [ 1,  0], # D
  [ 0,  1], # R
  [ 0, -1], # L
]

def calc
  used = Array.new(H * W) { 0 }
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    line.chars.map(&:to_sym)
  end.flatten(1)

  pp(used:) if $debug
  pp(used: used.map { |u| u.to_s(2) }) if $debug


  si, sj = s

  dp = []
  if 0 <= si - 1 && used[(si - 1) * W + sj] & 0b0001 == 0
    dp << [si - 1, sj, 0, nil]
    used[(si - 1) * W + sj] |= 0b0001
  end
  if si + 1 < H && used[(si + 1) * W + sj] & 0b0010 == 0
    dp << [si + 1, sj, 1, nil]
    used[(si + 1) * W + sj] |= 0b0010
  end
  if sj + 1 < W && used[si * W + (sj + 1)] & 0b0100 == 0
    dp << [si, sj + 1, 2, nil]
    used[si * W + (sj + 1)] |= 0b0100
  end
  if 0 <= sj - 1 && used[si * W + (sj - 1)] & 0b1000 == 0
    dp << [si, sj - 1, 3, nil]
    used[si * W + (sj - 1)] |= 0b1000
  end

  pp(dp:) if $debug
  pp(used:) if $debug
  pp(used: used.map { |u| u.to_s(2) }) if $debug

  while !dp.empty?
    p_d0_parent = dp.pop
    pi, pj, d0, parent = p_d0_parent
    pp(pi:, pj:, d0:) if $debug

    # d0i, d0j = $d2p[d0]
    # qi, qj = pi + d0i, pj + d0j

    # k = qi * W + qj
    x = board[pi * W + pj]
    # pp(x:, y:, z:) if $debug
    if x == :G
      return [true, p_d0_parent]
    elsif x == :'#'
      next
    elsif x == :'.'
      if 0 <= pi - 1 && used[(pi - 1) * W + pj] & 0b0001 == 0
        dp << [pi - 1, pj, 0, p_d0_parent]
        used[(pi - 1) * W + pj] |= 0b0001
      end
      if pi + 1 < H && used[(pi + 1) * W + pj] & 0b0010 == 0
        dp << [pi + 1, pj, 1, p_d0_parent]
        used[(pi + 1) * W + pj] |= 0b0010
      end
      if pj + 1 < W && used[pi * W + (pj + 1)] & 0b0100 == 0
        dp << [pi, pj + 1, 2, p_d0_parent]
        used[pi * W + (pj + 1)] |= 0b0100
      end
      if 0 <= pj - 1 && used[pi * W + (pj - 1)] & 0b1000 == 0
        dp << [pi, pj - 1, 3, p_d0_parent]
        used[pi * W + (pj - 1)] |= 0b1000
      end
    elsif x == :'x'
      if 0 <= pi - 1 && used[(pi - 1) * W + pj] & 0b0001 == 0 && d0 != 0
        dp << [pi - 1, pj, 0, p_d0_parent]
        used[(pi - 1) * W + pj] |= 0b0001
      end
      if pi + 1 < H && used[(pi + 1) * W + pj] & 0b0010 == 0 && d0 != 1
        dp << [pi + 1, pj, 1, p_d0_parent]
        used[(pi + 1) * W + pj] |= 0b0010
      end
      if pj + 1 < W && used[pi * W + (pj + 1)] & 0b0100 == 0 && d0 != 2
        dp << [pi, pj + 1, 2, p_d0_parent]
        used[pi * W + (pj + 1)] |= 0b0100
      end
      if 0 <= pj - 1 && used[pi * W + (pj - 1)] & 0b1000 == 0 && d0 != 3
        dp << [pi, pj - 1, 3, p_d0_parent]
        used[pi * W + (pj - 1)] |= 0b1000
      end
    else # x == :'o'
      if 0 <= pi - 1 && used[(pi - 1) * W + pj] & 0b0001 == 0 && d0 == 0
        dp << [pi - 1, pj, 0, p_d0_parent]
        used[(pi - 1) * W + pj] |= 0b0001
      end
      if pi + 1 < H && used[(pi + 1) * W + pj] & 0b0010 == 0 && d0 == 1
        dp << [pi + 1, pj, 1, p_d0_parent]
        used[(pi + 1) * W + pj] |= 0b0010
      end
      if pj + 1 < W && used[pi * W + (pj + 1)] & 0b0100 == 0 && d0 == 2
        dp << [pi, pj + 1, 2, p_d0_parent]
        used[pi * W + (pj + 1)] |= 0b0100
      end
      if 0 <= pj - 1 && used[pi * W + (pj - 1)] & 0b1000 == 0 && d0 == 3
        dp << [pi, pj - 1, 3, p_d0_parent]
        used[pi * W + (pj - 1)] |= 0b1000
      end
    end

    pp(dp:) if $debug

    # pp(dp:, used_D:, used_U:, used_R:, used_L:) if $debug
  end

  false
end


r, p_d0_parent = calc
# pp(r:, p_d0_parent:) if $debug
if r
  puts 'Yes'
  ds = []
  while p_d0_parent
    pi, pj, d0, parent = p_d0_parent
    ds << d0
    p_d0_parent = parent
  end
  s = ds.reverse.map do |d|
    'UDRL'[d]
  end.join('')
  puts s
else
  puts 'No'
end