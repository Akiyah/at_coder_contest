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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
LRS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def update(lines, black_sum, l, r)


  i0 = lines.bsearch_index { |line| l <= line[1] } # lをまたぐ最初の部分、必ず見つかる
  i1 = lines.bsearch_index { |line| r <= line[1] } # rをまたぐ最初の部分、必ず見つかる

  if i0 == i1 # (l..r)が含まれている
    l0, r0, color0 = lines[i0]
    if color0 # black
      # nothing
      return [lines, black_sum]
    else # white
      split_lines = []
      split_lines << [l0, l - 1, false] if i0 <= l - 1
      split_lines << [l, r, true]
      split_lines << [r + 1, r0, false] if r + 1 <= r0
      new_lines = lines[...i0] + split_lines + lines[(i0 + 1)..]
      return [new_lines, black_sum + (r - l + 1)]
    end
  else
    l0, r0, color0 = lines[i0]
    l1, r1, color1 = lines[i1]
    if color0 && color1
      new_lines = lines[...i0] + [[l0, r1, true]] + lines[(i1 + 1)..]
      d = (i0..i1).map { |i| lines[i][2] ? 0 : (lines[i][1] - lines[i][0] + 1) }.sum
      return [new_lines, black_sum + d]
    elsif !color0 && color1
      split_lines = []
      split_lines << [l0, l - 1, false] if l0 <= l - 1
      split_lines << [l, r1, true]
      new_lines = lines[...i0] + split_lines + lines[(i1 + 1)..]
      d = 0
      d += r0 - l + 1
      d += ((i0 + 1)..(i1 - 1)).map { |i| lines[i][2] ? 0 : (lines[i][1] - lines[i][0] + 1) }.sum
      pp(color0:, color1:, d:) if $debug
      return [new_lines, black_sum + d]
    elsif color0 && !color1
      split_lines = []
      split_lines << [l0, r, true]
      split_lines << [r + 1, r1, false] if r + 1 <= r1
      new_lines = lines[...i0] + split_lines + lines[(i1 + 1)..]
      d = 0
      d += r - l1 + 1
      d += ((i0 + 1)..(i1 - 1)).map { |i| lines[i][2] ? 0 : (lines[i][1] - lines[i][0] + 1) }.sum
      pp(l0:, r0:, color0:, l1:, r1:, color1:, d:) if $debug
      return [new_lines, black_sum + d]
    else # !color0 && !color1
      split_lines = []
      split_lines << [l0, l - 1, false] if l0 <= l - 1
      split_lines << [l, r, true]
      split_lines << [r + 1, r1, false] if r + 1 <= r1
      new_lines = lines[...i0] + split_lines + lines[(i1 + 1)..]
      d = 0
      d += r0 - l + 1
      d += r - l1 + 1
      d += ((i0 + 1)..(i1 - 1)).map { |i| lines[i][2] ? 0 : (lines[i][1] - lines[i][0] + 1) }.sum
      return [new_lines, black_sum + d]
    end
  end
end

# as = Array.new(N)
lines = [[1, N, false]] # 白が一つとみなす(l, r, color)
black_sum = 0
pp(lines:, black_sum:) if $debug

LRS.each do |l, r|
  pp(l:, r:) if $debug
  lines, black_sum = update(lines, black_sum, l, r)
  pp(lines:, black_sum:) if $debug
  puts N - black_sum
end


