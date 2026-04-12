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

def calc
  used = Array.new(H) { Array.new(W) { { 1 => { 0 => false }, 0 => { -1 => false,  1 => false }, -1 => { 0 => false } } } }
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    line.chars
  end

  si, sj = s

  dp = []
  dp << [si, sj, -1, 0, nil]
  used[si][sj][-1][0] = true
  dp << [si, sj, 1, 0, nil]
  used[si][sj][1][0] = true
  dp << [si, sj, 0, 1, nil]
  used[si][sj][0][1] = true
  dp << [si, sj, 0, -1, nil]
  used[si][sj][0][-1] = true

  pp(dp:) if $debug

  while !dp.empty?
    p_d0_parent = dp.shift
    pi, pj, d0i, d0j, parent = p_d0_parent
    pp(pi:, pj:, di0:, d0j:) if $debug

    qi, qj = pi + d0i, pj + d0j

    next if qi < 0 || H <= qi
    next if qj < 0 || W <= qj

    x = board[qi][qj]
    if x == 'G'
      return [true, p_d0_parent]
    elsif x == '#'
      next
    else
      used_q = used[qi][qj]
      [[-1, 0], [1, 0], [0, 1], [0, -1]].each do |di, dj|
        if (x == '.') || ((x == 'o') == (d0i == di && d0j == dj)) 
          b = used_q[di][dj]
          if !b
            dp << [qi, qj, di, dj, p_d0_parent]
            used_q[di][dj] = true
          end
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