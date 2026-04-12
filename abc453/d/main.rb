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

def check(used_q, qi, qj, di, dj, board)
  pi, pj = qi + di, qj + dj
  return false unless 0 <= pi && pi < H
  return false unless 0 <= pj && pj < W
  return false if board[pi][pj] == :'#'

  b = used_q[di][dj]
  used_q[di][dj] = true if !b
  !b
end

def calc
  used = Array.new(H) { Array.new(W) { { 1 => { 0 => false }, 0 => { -1 => false,  1 => false }, -1 => { 0 => false } } } }
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    line.chars.map(&:to_sym)
  end

  si, sj = s

  dijs = {}
  dijs[:'.'] = {
    1 => {
      0 => [[-1, 0], [1, 0], [0, 1], [0, -1]],
    },
    0 => {
      1 => [[-1, 0], [1, 0], [0, 1], [0, -1]],
      -1 => [[-1, 0], [1, 0], [0, 1], [0, -1]],
    },
    -1 => {
      0 => [[-1, 0], [1, 0], [0, 1], [0, -1]],
    },
  }
  dijs[:o] = {
    1 => {
      0 => [[1, 0]],
    },
    0 => {
      1 => [[0, 1]],
      -1 => [[0, -1]],
    },
    -1 => {
      0 => [[-1, 0]],
    },
  }
  dijs[:x] = {
    1 => {
      0 => [[-1, 0], [0, 1], [0, -1]],
    },
    0 => {
      1 => [[-1, 0], [1, 0], [0, -1]],
      -1 => [[-1, 0], [1, 0], [0, 1]],
    },
    -1 => {
      0 => [[1, 0], [0, 1], [0, -1]],
    },
  }


  dp = []
  dijs[:'.'][1][0].each do |di, dj|
    used_q = used[si][sj] 
    if check(used_q, si, sj, di, dj, board)
      dp << [si, sj, di, dj, nil]
    end
  end

  pp(dp:) if $debug

  while !dp.empty?
    p_d0_parent = dp.shift
    pi, pj, d0i, d0j, parent = p_d0_parent
    pp(pi:, pj:, d0i:, d0j:) if $debug

    qi, qj = pi + d0i, pj + d0j

    x = board[qi][qj]
    if x == :G
      return [true, p_d0_parent]
    elsif x == :'#'
      next
    else
      used_q = used[qi][qj]
      dijs[x][d0i][d0j].each do |di, dj|
        if check(used_q, qi, qj, di, dj, board)
          dp << [qi, qj, di, dj, p_d0_parent]
        end
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
    pi, pj, d0i, d0j, parent = p_d0_parent
    ds << [d0i, d0j]
    p_d0_parent = parent
  end
  s = ds.reverse.map do |di, dj|
    di == 0 ? (dj == 1 ? 'R' : 'L') : (di == 1 ? 'D' : 'U')
  end.join('')
  puts s
else
  puts 'No'
end