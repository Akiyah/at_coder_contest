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

  used = Array.new(H) { Array.new(W) { {} } }
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    line.chars
  end

  pp(used:, s:, board:) if $debug



  dp = []
  if s[0] < H - 1
    dp << [s, 'D']
    used[s[0]][s[1]]['D'] = true
  end
  if 0 < s[0]
    dp << [s, 'U']
    used[s[0]][s[1]]['U'] = true
  end
  if s[1] < W - 1
    dp << [s, 'R']
    used[s[0]][s[1]]['R'] = true
  end
  if 0 < s[1]
    dp << [s, 'L']
    used[s[0]][s[1]]['L'] = true
  end

  pp(dp:) if $debug

  while 0 < dp.length
    p, ds = dp.shift
    pp(p:, ds:) if $debug
    pi, pj = p
    d0 = ds[-1]

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

    if board[qi][qj] == 'G'
      return [true, ds]
    elsif board[qi][qj] == '.'
      if qi < H - 1
        if !used[qi][qj]['D']
          dp << [[qi, qj], ds + 'D']
        end
      end
      if 0 < qi
        if !used[qi][qj]['U']
          dp << [[qi, qj], ds + 'U']
        end
      end
      if qj < W - 1
        if !used[qi][qj]['R']
          dp << [[qi, qj], ds + 'R']
        end
      end
      if 0 < qj
        if !used[qi][qj]['L']
          dp << [[qi, qj], ds + 'L']
        end
      end
      used[qi][qj]['D'] = true
      used[qi][qj]['U'] = true
      used[qi][qj]['R'] = true
      used[qi][qj]['L'] = true
    elsif board[qi][qj] == 'x'
      if qi < H - 1 && d0 != 'D'
        if !used[qi][qj]['D']
          dp << [[qi, qj], ds + 'D']
        end
      end
      if 0 < qi && d0 != 'U'
        if !used[qi][qj]['U']
          dp << [[qi, qj], ds + 'U']
        end
      end
      if qj < W - 1 && d0 != 'R'
        if !used[qi][qj]['R']
          dp << [[qi, qj], ds + 'R']
        end
      end
      if 0 < qj && d0 != 'L'
        if !used[qi][qj]['L']
          dp << [[qi, qj], ds + 'L']
        end
      end

      used[qi][qj]['D'] = true if d0 != 'D'
      used[qi][qj]['U'] = true if d0 != 'U'
      used[qi][qj]['R'] = true if d0 != 'R'
      used[qi][qj]['L'] = true if d0 != 'L'
    elsif board[qi][qj] == 'o'
      if qi < H - 1 && d0 == 'D'
        if !used[qi][qj]['D']
          dp << [[qi, qj], ds + 'D']
        end
      end
      if 0 < qi && d0 == 'U'
        if !used[qi][qj]['U']
          dp << [[qi, qj], ds + 'U']
        end
      end
      if qj < W - 1 && d0 == 'R'
        if !used[qi][qj]['R']
          dp << [[qi, qj], ds + 'R']
        end
      end
      if 0 < qj && d0 == 'L'
        if !used[qi][qj]['L']
          dp << [[qi, qj], ds + 'L']
        end
      end
      used[qi][qj]['D'] = true if d0 == 'D'
      used[qi][qj]['U'] = true if d0 == 'U'
      used[qi][qj]['R'] = true if d0 == 'R'
      used[qi][qj]['L'] = true if d0 == 'L'
    else #  board[pi][pj] == '#'
    end

  end

  false
end


r, ds = calc
if r
  puts 'Yes'
  puts ds
else
  puts 'No'
end