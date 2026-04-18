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
  # used = Array.new(H) { Array.new(W) { [false, false, false, false] } }
  used = Array.new(H * W * 4)
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    syss = line.chars.map(&:to_sym)
    syss.each.with_index do |x, j|
      if x == :'#'
        used[((i + 1) * W + j) * 4 + 0] = true if i + 1 < H # U
        used[((i - 1) * W + j) * 4 + 1] = true if 0 < i - 1 # D
        used[(i * W + (j - 1)) * 4 + 2] = true if j + 1 < W # R
        used[(i * W + (j + 1)) * 4 + 3] = true if 0 < j - 1 # L
      end
    end
    syss.map { |x| [x, x == :'.', x == :'o', x == :'#'] }
  end.flatten(1)

  H.times do |i|
    used[(i * W + 0) * 4 + 3] = true # L
    used[(i * W + (W - 1)) * 4 + 2] = true # R
  end
  W.times do |j|
    used[(0 * W + j) * 4 + 0] = true # U
    used[((H - 1) * W + j) * 4 + 1] = true # D
  end
  # H.times do |i|
  #   W.times do |j|
  #     x, y, z, w = board[i * W + j]
  #     pp(x:, y:, z:) if $debug
  #     if w
  #       used[((i + 1) * W + j) * 4 + 0] = true if i + 1 < H # U
  #       used[((i - 1) * W + j) * 4 + 1] = true if 0 < i - 1 # D
  #       used[(i * W + (j - 1)) * 4 + 2] = true if j + 1 < W # R
  #       used[(i * W + (j + 1)) * 4 + 3] = true if 0 < j - 1 # L
  #     end
  #   end
  # end

  pp(used:) if $debug


  si, sj = s

  dp = []
  k = si * W + sj
  (0..3).each do |d|
    next if used[k * 4 + d]

    used[k * 4 + d] = true

    dp << [si, sj, d, nil]
  end

  pp(dp:) if $debug

  while !dp.empty?
    p_d0_parent = dp.pop
    pi, pj, d0, parent = p_d0_parent
    pp(pi:, pj:, d0:) if $debug

    d0i, d0j = $d2p[d0]
    qi, qj = pi + d0i, pj + d0j

    k = qi * W + qj
    k4 = k * 4
    x, y, z = board[k]
    pp(x:, y:, z:) if $debug
    if x == :G
      return [true, p_d0_parent]
    # elsif x == :'#'
    #   next
    else
      (0..3).each do |d|
        next unless y || (z == (d == d0))
        # next unless (x == :'.') || ((x == :'o') == (d == d0))

        k2 = k4 + d

        b = used[k2]
        next if b

        used[k2] = true

        dp << [qi, qj, d, p_d0_parent]
      end
    end

    pp(dp: dp[0...3]) if $debug

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