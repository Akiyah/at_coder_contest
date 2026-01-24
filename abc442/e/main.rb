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
XYS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
ABS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

def count_monsters(x, y, xyris_x_0_y_plus, xyris_x_0_y_minus, xyris_x_plus, xyris_x_minus, rs_x_plus, rs_x_minus, r_counts_x_plus, r_counts_x_minus, r_count_sum_x_plus, r_count_sum_x_minus)
  count = 0

  count += xyris_x_0_y_plus.length
  return count if x == 0 && 0 < y

  if 0 < x
    r = Rational(y, x)
    count += r_count_sum_x_plus[r]
    return count
  end

  count += r_count_sum_x_plus[rs_x_plus[-1]] if rs_x_plus[-1]

  count += xyris_x_0_y_minus.length
  return count if x == 0 && y < 0

  # if x < 0
  r = Rational(y, x)
  count += r_count_sum_x_minus[r]
  count

end

def count_monsters_line(x, y, xyris_x_0_y_plus, xyris_x_0_y_minus, xyris_x_plus, xyris_x_minus, rs_x_plus, rs_x_minus, r_counts_x_plus, r_counts_x_minus, r_count_sum_x_plus, r_count_sum_x_minus)

  return xyris_x_0_y_plus.length if x == 0 && 0 < y
  return xyris_x_0_y_minus.length if x == 0 && y < 0

  if 0 < x
    r = Rational(y, x)
    return r_counts_x_plus[r]
  end

  # x < 0
  r = Rational(y, x)
  r_counts_x_minus[r]
end

def calc
  xyris = XYS.map.with_index do |(x, y), i|
    if x == 0
      [x, y, nil, i]
    else
      [x, y, Rational(y, x), i]
    end
  end

  pp(xyris:) if $debug

  xyris_x_0_y_plus = xyris.select { |x, y, r, i| x == 0 && 0 < y }
  xyris_x_0_y_minus = xyris.select { |x, y, r, i| x == 0 && y < 0 }

  xyris_x_plus = xyris.select { |x, y, r, i| 0 < x }
  xyris_x_minus = xyris.select { |x, y, r, i| x < 0 }

  xyris_x_plus.sort! do |(x0, y0, r0, i0), (x1, y1, r1, i1)|
    r1 <=> r0
  end

  xyris_x_minus.sort! do |(x0, y0, r0, i0), (x1, y1, r1, i1)|
    r1 <=> r0
  end


  pp(xyris_x_0_y_plus:) if $debug
  pp(xyris_x_0_y_minus:) if $debug
  pp(xyris_x_plus:) if $debug
  pp(xyris_x_minus:) if $debug

  rs_x_plus = []
  r_counts_x_plus = {}
  last_r = nil
  xyris_x_plus.each do |x, y, r, i|
    rs_x_plus << r if last_r != r
    r_counts_x_plus[r] ||= 0
    r_counts_x_plus[r] += 1
    last_r = r
  end

  pp(rs_x_plus:) if $debug
  pp(r_counts_x_plus:) if $debug

  rs_x_minus = []
  r_counts_x_minus = {}
  last_r = nil
  xyris_x_minus.each do |x, y, r, i|
    rs_x_minus << r if last_r != r
    r_counts_x_minus[r] ||= 0
    r_counts_x_minus[r] += 1
    last_r = r
  end

  pp(rs_x_minus:) if $debug
  pp(r_counts_x_minus:) if $debug


  r_count_sum_x_plus = {}
  last_count = 0
  rs_x_plus.each do |r|
    last_count += r_counts_x_plus[r]
    r_count_sum_x_plus[r] = last_count
  end
  pp(r_count_sum_x_plus:) if $debug

  r_count_sum_x_minus = {}
  last_count = 0
  rs_x_minus.each do |r|
    last_count += r_counts_x_minus[r]
    r_count_sum_x_minus[r] = last_count
  end
  pp(r_count_sum_x_minus:) if $debug





  ABS.each do |a, b|
    x0, y0 = XYS[a - 1]
    x1, y1 = XYS[b - 1]

    count0 = count_monsters(x0, y0, xyris_x_0_y_plus, xyris_x_0_y_minus, xyris_x_plus, xyris_x_minus, rs_x_plus, rs_x_minus, r_counts_x_plus, r_counts_x_minus, r_count_sum_x_plus, r_count_sum_x_minus)
    count_line0 = count_monsters_line(x0, y0, xyris_x_0_y_plus, xyris_x_0_y_minus, xyris_x_plus, xyris_x_minus, rs_x_plus, rs_x_minus, r_counts_x_plus, r_counts_x_minus, r_count_sum_x_plus, r_count_sum_x_minus)
    count1 = count_monsters(x1, y1, xyris_x_0_y_plus, xyris_x_0_y_minus, xyris_x_plus, xyris_x_minus, rs_x_plus, rs_x_minus, r_counts_x_plus, r_counts_x_minus, r_count_sum_x_plus, r_count_sum_x_minus)
    count_line1 = count_monsters_line(x1, y1, xyris_x_0_y_plus, xyris_x_0_y_minus, xyris_x_plus, xyris_x_minus, rs_x_plus, rs_x_minus, r_counts_x_plus, r_counts_x_minus, r_count_sum_x_plus, r_count_sum_x_minus)
    pp(count0:, count_line0:, count1:, count_line1:) if $debug


    if count0 == count1
      r = count_line0
    elsif count0 < count1
      r = count1 - count0 + count_line0
    else
      r = N - (count0 - count1 + count_line1) + count_line0 + count_line1
    end
    puts r
  end

end



calc