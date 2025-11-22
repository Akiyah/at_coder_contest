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


def run(n, m, xs0, ys0)
  # unless (xs0 + ys0).sort == (1..(n * m)).to_a
  #   puts 'No'
  #   return
  # end


  xs1 = xs0.map.with_index { |x, i| [x, i] }.sort_by {|x, i| x}.reverse
  ys1 = ys0.map.with_index { |y, i| [y, i] }.sort_by {|y, i| y}.reverse

  xj2i = []
  xs1.each.with_index do |(x, i), j|
    xj2i[i] = j
  end
  yj2i = []
  ys1.each.with_index do |(y, i), j|
    yj2i[i] = j
  end

  xs = xs1.map { |x, i| x}
  ys = ys1.map { |y, i| y}


  ans = Array.new(n) { Array.new(m) }

  unless n * m == xs[0] && n * m == ys[0]
    puts 'No'
    return
  end

  ans[0][0] = n * m

  i = 0
  j = 0
  free_areas = []
  free_area_count = 0

  (1...(n * m)).to_a.reverse.each do |a|
    if i + 1 < n && j + 1 < m && a == xs[i + 1] && a == ys[j + 1]
      ans[i + 1][j + 1] = a
      (0..i).each do |i2|
        free_areas << [i2, j + 1]
        free_area_count += 1
      end
      (0..j).each do |j2|
        free_areas << [i + 1, j2]
        free_area_count += 1
      end
      i += 1
      j += 1
    elsif i + 1 < m && a == xs[i + 1]
      ans[i + 1][0] = a
      (1..j).each do |j2|
        free_areas << [i + 1, j2]
        free_area_count += 1
      end
      i += 1
    elsif j + 1 < m && a == ys[j + 1]
      ans[0][j + 1] = a
      (1..i).each do |i2|
        free_areas << [i2, j + 1]
        free_area_count += 1
      end
      j += 1
    else
      if 0 < free_area_count
        free_area_count -= 1
        i2, j2 = free_areas.shift
        ans[i2][j2] = a
      else
        puts 'No'
        return
      end
    end
  end

  puts 'Yes'
  n.times do |i_n|
    jn = xj2i[i_n]
    s = m.times.map do |im|
      jm = yj2i[im]
      ans[jn][jm]
    end.join(' ')
    puts s
  end
end

T.times do
  n, m = STDIN.gets.chomp.split.map(&:to_i)
  xs = STDIN.gets.chomp.split.map(&:to_i)
  ys = STDIN.gets.chomp.split.map(&:to_i)
  run(n, m, xs, ys)
end


