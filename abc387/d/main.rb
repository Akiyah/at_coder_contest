#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end

H, W = STDIN.gets.chomp.split.map(&:to_i)

SS = (1..H).map do
  STDIN.gets.chomp.split('')
end


def calc_one(i, j, tate)

  steps = [[i, j, tate]]

  all_steps = {}
  all_steps[true] = Array.new(H) { Array.new(W) }
  all_steps[false] = Array.new(H) { Array.new(W) }
  all_steps[tate][i][j] = true

  r = 0

  while 0 < steps.length
    pp steps if $debug
    next_steps = []
    steps.each do |i, j, tate|
      return r if SS[i][j] == 'G'

      if tate
        if 0 < i && SS[i - 1][j] != '#'
          if !all_steps[!tate][i - 1][j]
            next_steps << [i - 1, j, !tate]
            all_steps[!tate][i - 1][j] = true
          end
        end

        if i < H - 1 && SS[i + 1][j] != '#'
          if !all_steps[!tate][i + 1][j]
            next_steps << [i + 1, j, !tate]
            all_steps[!tate][i + 1][j] = true
          end
        end

      else
        if 0 < j && SS[i][j - 1] != '#'
          if !all_steps[!tate][i][j - 1]
            next_steps << [i, j - 1, !tate]
            all_steps[!tate][i][j - 1] = true
          end
        end

        if j < W - 1 && SS[i][j + 1] != '#'
          if !all_steps[!tate][i][j + 1]
            next_steps << [i, j + 1, !tate]
            all_steps[!tate][i][j + 1] = true
          end
        end

      end
    end
    r += 1
    steps = next_steps
  end

  return -1
end


def calc(start)
  r1 = calc_one(start[0], start[1], true)
  pp ['r1', r1] if $debug
  r2 = calc_one(start[0], start[1], false)
  pp ['r2', r2] if $debug

  if 0 < r1 || 0 < r2
    if 0 < r1 && 0 < r2
      [r1, r2].min
    elsif r1 < 0
      r2
    else
      r1
    end
  else
    -1
  end
end


start = nil
SS.each_with_index do |line, i|
  line.each_with_index do |s, j|
    start = [i, j] if s == 'S'
  end
end

pp SS if $debug
pp start if $debug

puts calc(start) # true 縦


