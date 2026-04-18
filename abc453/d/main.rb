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
    line.chars.map(&:to_sym)
  end

  si, sj = s

  dp = []
  # used_q = used[si][sj]
  (0..3).each do |d|
    # used_q[d] = true
    used[(si * W + sj) * 4 + d] = true

    pd = $d2p[d]
    di, dj = pd
    ri, rj = si + di, sj + dj
    next unless 0 <= ri && ri < H
    next unless 0 <= rj && rj < W
    next if board[ri][rj] == :'#'

    dp << [si, sj, d, nil]
  end

  pp(dp:) if $debug

  while !dp.empty?
    p_d0_parent = dp.pop
    pi, pj, d0, parent = p_d0_parent
    pp(pi:, pj:, d0:) if $debug

    d0i, d0j = $d2p[d0]
    qi, qj = pi + d0i, pj + d0j

    x = board[qi][qj]
    if x == :G
      return [true, p_d0_parent]
    elsif x == :'#'
      next
    else
      # used_q = used[qi][qj]
      (0..3).each do |d|
        next unless (x == :'.') || ((x == :'o') == (d == d0))

        # b = used_q[d]
        b = used[(qi * W + qj) * 4 + d]
        next if b

        # used_q[d] = true
        used[(qi * W + qj) * 4 + d] = true

        pd = $d2p[d]
        di, dj = pd
        ri, rj = qi + di, qj + dj
        next unless (0 <= ri && ri < H) && (0 <= rj && rj < W)
        next if board[ri][rj] == :'#'

        dp << [qi, qj, d, p_d0_parent]
      end
    end

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