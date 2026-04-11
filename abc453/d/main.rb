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
  used = Array.new(H) { Array.new(W) { Array.new(4) } }
  s = []

  board = SS.map.with_index do |line, i|
    js = line.index('S')
    s = [i, js] if js
    line.tr!('S', '.')
    line.chars
  end

  si, sj = s

  dp = []
  dp << [s, 0, nil]
  used[si][sj][0] = true
  dp << [s, 1, nil]
  used[si][sj][1] = true
  dp << [s, 2, nil]
  used[si][sj][2] = true
  dp << [s, 3, nil]
  used[si][sj][3] = true

  pp(dp:) if $debug

  dpis = [-1, 1, 0, 0]
  dpjs = [0, 0, 1, -1]
  while !dp.empty?
    p_d0_parent = dp.shift
    p, d0, parent = p_d0_parent
    pp(p:, d0:) if $debug
    pi, pj = p

    qi, qj = pi + dpis[d0], pj + dpjs[d0]

    # if d0 == 0
    #   qi, qj = pi - 1, pj
    # elsif d0 == 1
    #   qi, qj = pi + 1, pj
    # elsif d0 == 2
    #   qi, qj = pi, pj + 1
    # elsif d0 == 3
    #   qi, qj = pi, pj - 1
    # end

    next if qi < 0 || H <= qi
    next if qj < 0 || W <= qj

    x = board[qi][qj]
    if x == 'G'
      return [true, p_d0_parent]
    elsif x == '#'
      next
    elsif x == '.'
      used_q = used[qi][qj]
      used_q.each.with_index do |b, d|
        if !b
          dp << [[qi, qj], d, p_d0_parent]
          used_q[d] = true
        end
      end
    elsif x == 'o'
      used_q = used[qi][qj]
      used_q.each.with_index do |b, d|
        if d0 == d
          if !b
            dp << [[qi, qj], d, p_d0_parent]
            used_q[d] = true
          end
        end
      end
    else # x == 'x'
      used_q = used[qi][qj]
      used_q.each.with_index do |b, d|
        if d0 != d
          if !b
            dp << [[qi, qj], d, p_d0_parent]
            used_q[d] = true
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
  puts ds.reverse.map { |d| 'UDRL'[d]  }.join('')
else
  puts 'No'
end