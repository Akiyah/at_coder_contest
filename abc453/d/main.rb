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

def calc
  used_D = Array.new(H) { Array.new(W) }
  used_U = Array.new(H) { Array.new(W) }
  used_R = Array.new(H) { Array.new(W) }
  used_L = Array.new(H) { Array.new(W) }
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    line.chars
  end

  si, sj = s

  dp = []
  dp << [s, 'D', nil]
  used_D[si][sj] = true
  dp << [s, 'U', nil]
  used_U[si][sj] = true
  dp << [s, 'R', nil]
  used_R[si][sj] = true
  dp << [s, 'L', nil]
  used_L[si][sj] = true

  pp(dp:) if $debug

  while 0 < dp.length
    p_d0_parent = dp.shift
    p, d0, parent = p_d0_parent
    pp(p:, d0:) if $debug
    pi, pj = p

    if d0 == 'U'
      qi, qj = pi - 1, pj
    elsif d0 == 'D'
      qi, qj = pi + 1, pj
    elsif d0 == 'R'
      qi, qj = pi, pj + 1
    elsif d0 == 'L'
      qi, qj = pi, pj - 1
    end

    next if qi < 0 || H <= qi
    next if qj < 0 || W <= qj

    x = board[qi][qj]
    if x == 'G'
      return [true, p_d0_parent]
    elsif x == '#'
      next
    elsif x == '.'
      if !used_D[qi][qj]
        dp << [[qi, qj], 'D', p_d0_parent]
        used_D[qi][qj] = true
      end
      if !used_U[qi][qj]
        dp << [[qi, qj], 'U', p_d0_parent]
        used_U[qi][qj] = true
      end
      if !used_R[qi][qj]
        dp << [[qi, qj], 'R', p_d0_parent]
        used_R[qi][qj] = true
      end
      if !used_L[qi][qj]
        dp << [[qi, qj], 'L', p_d0_parent]
        used_L[qi][qj] = true
      end
    elsif x == 'o'
      if d0 == 'D'
        if !used_D[qi][qj]
          dp << [[qi, qj], 'D', p_d0_parent]
          used_D[qi][qj] = true
        end
      end
      if d0 == 'U'
        if !used_U[qi][qj]
          dp << [[qi, qj], 'U', p_d0_parent]
          used_U[qi][qj] = true
        end
      end
      if d0 == 'R'
        if !used_R[qi][qj]
          dp << [[qi, qj], 'R', p_d0_parent]
          used_R[qi][qj] = true
        end
      end
      if d0 == 'L'
        if !used_L[qi][qj]
          dp << [[qi, qj], 'L', p_d0_parent]
          used_L[qi][qj] = true
        end
      end
    else # x == 'x'
      if d0 != 'D'
      if !used_D[qi][qj]
          dp << [[qi, qj], 'D', p_d0_parent]
          used_D[qi][qj] = true
        end
      end
      if d0 != 'U'
        if !used_U[qi][qj]
          dp << [[qi, qj], 'U', p_d0_parent]
          used_U[qi][qj] = true
        end
      end
      if d0 != 'R'
        if !used_R[qi][qj]
          dp << [[qi, qj], 'R', p_d0_parent]
          used_R[qi][qj] = true
        end
      end
      if d0 != 'L'
        if !used_L[qi][qj]
          dp << [[qi, qj], 'L', p_d0_parent]
          used_L[qi][qj] = true
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
    p, d0, parent = p_d0_parent
    ds << d0
    p_d0_parent = parent
  end
  puts ds.reverse.join('')
else
  puts 'No'
end