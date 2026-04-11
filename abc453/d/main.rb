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


# def to_d(i, j)
#   if i == 0
#     j == 1 ? 1 : 3
#   else
#     i == 1 ? 2 : 0
#   end
# end

# def to_ij(d)
#   return [-1, 0] if d == 0
#   return [0, 1] if d == 1
#   return [1, 0] if d == 2
#   [0, -1]
# end

# def to_k(d)
#   return 'U' if d == 0
#   return 'R' if d == 1
#   return 'D' if d == 2
#   'L'
# end

def calc

  used_D = Array.new(H * W)
  used_U = Array.new(H * W)
  used_R = Array.new(H * W)
  used_L = Array.new(H * W)
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    line.chars
  end

  # pp(used:, s:, board:) if $debug

  si, sj = s

  dp = []
  if s[0] < H - 1
    dp << [s, 'D', nil]
    used_D[si * W + sj] = true
  end
  if 0 < s[0]
    dp << [s, 'U', nil]
    used_U[si * W + sj] = true
  end
  if s[1] < W - 1
    dp << [s, 'R', nil]
    used_R[si * W + sj] = true
  end
  if 0 < s[1]
    dp << [s, 'L', nil]
    used_L[si * W + sj] = true
  end

  pp(dp:) if $debug

  while 0 < dp.length
    p_d0_parent = dp.shift
    p, d0, parent = p_d0_parent
    pp(p:, d0:) if $debug
    pi, pj = p

    if d0 == 'U'
      qi = pi - 1
      qj = pj
    elsif d0 == 'D'
      qi = pi + 1
      qj = pj
    elsif d0 == 'R'
      qi = pi
      qj = pj + 1
    elsif d0 == 'L'
      qi = pi
      qj = pj - 1
    end

    x = board[qi][qj]
    if x == 'G'
      return [true, p_d0_parent]
    elsif x == '#'
      next
    else
      if qi < H - 1
        if !used_D[qi * W + qj]
          if ((x == '.') || (x == 'o' && d0 == 'D') || (x == 'x' && d0 != 'D'))
            dp << [[qi, qj], 'D', p_d0_parent]
            used_D[qi * W + qj] = true
          end
        end
      end
      if 0 < qi
        if !used_U[qi * W + qj]
          if ((x == '.') || (x == 'o' && d0 == 'U') || (x == 'x' && d0 != 'U'))
            dp << [[qi, qj], 'U', p_d0_parent]
            used_U[qi * W + qj] = true
          end
        end
      end
      if qj < W - 1
        if !used_R[qi * W + qj]
          if ((x == '.') || (x == 'o' && d0 == 'R') || (x == 'x' && d0 != 'R'))
            dp << [[qi, qj], 'R', p_d0_parent]
            used_R[qi * W + qj] = true
          end
        end
      end
      if 0 < qj
        if !used_L[qi * W + qj]
          if ((x == '.') || (x == 'o' && d0 == 'L') || (x == 'x' && d0 != 'L'))
            dp << [[qi, qj], 'L', p_d0_parent]
            used_L[qi * W + qj] = true
          end
        end
      end
    end

    pp(dp:, used_D:, used_U:, used_R:, used_L:) if $debug
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