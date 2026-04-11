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

  # pp(used:, s:, board:) if $debug

  si, sj = s

  dp = []
  if s[0] < H - 1
    dp << [s, 'D', nil]
    used_D[si][sj] = true
  end
  if 0 < s[0]
    dp << [s, 'U', nil]
    used_U[si][sj] = true
  end
  if s[1] < W - 1
    dp << [s, 'R', nil]
    used_R[si][sj] = true
  end
  if 0 < s[1]
    dp << [s, 'L', nil]
    used_L[si][sj] = true
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
      if !used_D[qi][qj]
        if qi < H - 1
          if ((x == '.') || (x == 'o' && d0 == 'D') || (x == 'x' && d0 != 'D'))
            dp << [[qi, qj], 'D', p_d0_parent]
            used_D[qi][qj] = true
          end
        end
      end
      if !used_U[qi][qj]
        if 0 < qi
          if ((x == '.') || (x == 'o' && d0 == 'U') || (x == 'x' && d0 != 'U'))
            dp << [[qi, qj], 'U', p_d0_parent]
            used_U[qi][qj] = true
          end
        end
      end
      if !used_R[qi][qj]
        if qj < W - 1
          if ((x == '.') || (x == 'o' && d0 == 'R') || (x == 'x' && d0 != 'R'))
            dp << [[qi, qj], 'R', p_d0_parent]
            used_R[qi][qj] = true
          end
        end
      end
      if !used_L[qi][qj]
        if 0 < qj
          if ((x == '.') || (x == 'o' && d0 == 'L') || (x == 'x' && d0 != 'L'))
            dp << [[qi, qj], 'L', p_d0_parent]
            used_L[qi][qj] = true
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
    p, d0, parent = p_d0_parent
    ds << d0
    p_d0_parent = parent
  end
  puts ds.reverse.join('')
else
  puts 'No'
end