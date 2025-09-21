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

def calc_one(h, w, ss, squares, exist_squares, counts)
  pp(squares:, exist_squares:, counts:) if $debug
  return 0 if squares.length == 0

  i, j = squares[0]
  unless exist_squares[i * w + j] # すでに使われている
    return calc_one(h, w, ss, squares[1..], exist_squares, counts)
  end

  m = [
    counts[i * w + j],
    counts[(i + 1) * w + j],
    counts[i * w + j + 1],
    counts[(i + 1) * w + j + 1],
  ].max

  ijs = []

  if m == 1
    ijs << [i, j]
  else
    ijs << [i, j] if 1 < counts[i * w + j]
    ijs << [i + 1, j] if 1 < counts[(i + 1) * w + j]
    ijs << [i, j + 1] if 1 < counts[i * w + j + 1]
    ijs << [i + 1, j + 1] if 1 < counts[(i + 1) * w + j + 1]
  end

  # ijs = [[i, j], [i + 1, j], [i, j + 1], [i + 1, j + 1]]

  pp(ijs:) if $debug

  rs = []
  ijs.each do |i1, j1|
    exist_squares2 = exist_squares.dup
    counts2 = counts.dup

    [[i1, j1], [i1 - 1, j1], [i1, j1 - 1], [i1 - 1, j1 - 1]].each do |i2, j2|
      if 0 <= i2 && 0 <= j2 && exist_squares2[i2 * w + j2]
        exist_squares2[i2 * w + j2] = false
        counts2[i2 * w + j2] -= 1
        counts2[(i2 + 1) * w + j2] -= 1
        counts2[i2 * w + j2 + 1] -= 1
        counts2[(i2 + 1) * w + j2 + 1] -= 1
      end
    end

    rs << calc_one(h, w, ss, squares[1..], exist_squares2, counts2)
  end

  1 + rs.min
end

def calc
  h, w = STDIN.gets.chomp.split.map(&:to_i)
  ss = (1..h).map do
    STDIN.gets.chomp.split('').map { |c| c == '#' }
  end

  squares = []
  exist_squares = Array.new(h * w, false)
  counts = Array.new(h * w, 0)
  (0...(h - 1)).each do |i|
    (0...(w - 1)).each do |j|
      if ss[i][j] && ss[i + 1][j] && ss[i][j + 1] && ss[i + 1][j + 1]
        squares << [i, j]
        exist_squares[i * w + j] = true
        counts[i * w + j] += 1
        counts[(i + 1) * w + j] += 1
        counts[i * w + j + 1] += 1
        counts[(i + 1) * w + j + 1] += 1
      end
    end
  end

  calc_one(h, w, ss, squares, exist_squares, counts)
end



T.times do
  puts calc
end



