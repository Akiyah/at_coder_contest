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

T = STDIN.gets.chomp.to_i
pp(T:) if $debug


def axis_index(x, y)
  return [1, x, y] if 0 <= y && 0 < x
  return [2, y, -x] if x <= 0 && 0 < y
  return [3, -x, -y] if y <= 0 && x < 0
  [4, -y, x]
end

def diff(x1, y1, x2, y2)
  pp(x1:, y1:, x2:, y2:) if $debug
  i1, x_1, y_1 = axis_index(x1, y1)
  i2, x_2, y_2 = axis_index(x2, y2)
  pp(i1:, x_1:, y_1:) if $debug
  pp(i2:, x_2:, y_2:) if $debug
  return i1 <=> i2 unless i1 == i2

  x2 * y1 <=> x1 * y2
end


def calc(n, xys)

  return 1 if n == 1


  pp(n:, xys:) if $debug

  xys_sorted = xys.sort { |(x1, y1), (x2, y2)| diff(x1, y1, x2, y2) }

  pp(xys_sorted:) if $debug
  


  i = 0
  j = 0
  max_count = 0
  xys_sorted.each.with_index do |(x1, y1), i|
    i1, x_1, y_1 = axis_index(x1, y1)
    pp(i:, x1:, y1:, i1:, x_1:, y_1:) if $debug

    while true
      pp(j:) if $debug
      x2, y2 = xys_sorted[j % n]
      i2, x_2, y_2 = axis_index(x2, y2)

      if i1 % 4 == i2 % 4
        if y_2 * x_1 >= y_1 * x_2
          # OK
        else
          # NG
          break
        end
      elsif (i1 + 1) % 4 == i2 % 4
        # OK
      elsif (i1 + 2) % 4 == i2 % 4
        if !(y_2 * x_1 >= y_1 * x_2)
          # OK
        else
          # NG
          break
        end
      else
        # NG
        break
      end
      j += 1
      break if i % n == j % n
    end

    max_count = [max_count, j - i, n - (j - i)].max
    pp(i:, j:, max_count:) if $debug
  end

  max_count
end


T.times do
  n = STDIN.gets.chomp.to_i
  pp(n:) if $debug
  xys = (1..n).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end
  puts calc(n, xys)
end


