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

DIJS = [[0, 0], [1, 0], [0, 1], [1, 1]]

def calc_one(h, w, squares, exist_squares, effects)
  pp(squares:, exist_squares:, effects:) if $debug
  return 0 if squares.length == 0

  i, j = squares[0]
  unless exist_squares[i * w + j] # すでに使われている
    return calc_one(h, w, squares[1..], exist_squares, effects)
  end

  # m = DIJS.map do |di, dj|
  #   counts[(i + di) * w + (j + dj)]
  # end.max

  # if m == 1
  #   ijs = [[i, j]]
  # else
  ijs = []
  zs = []
  DIJS.each do |di, dj|
    z = 0
    DIJS.each_with_index do |(di2, dj2), k|
      if 0 <= i + di - di2 && j + dj - dj2
        if exist_squares[(i + di - di2) * w + (j + dj - dj2)]
          z += (1 << k)
        end
      end
    end
    zs << z
  end

  e00 = effects[(i + 0) * w + (j + 0)]
  e10 = effects[(i + 1) * w + (j + 0)]
  e01 = effects[(i + 0) * w + (j + 1)]
  e11 = effects[(i + 1) * w + (j + 1)]
  pp(e00:, e10:, e01:, e11:) if $debug

  # unless e00.proper_subset?(e10) || e00.proper_subset?(e01) || e00.proper_subset?(e11)
  #   ijs << [i + 0, j + 0]
  # end

  # unless e10.subset?(e00) || e10.proper_subset?(e01) || e10.proper_subset?(e11)
  #   ijs << [i + 1, j + 0]
  # end

  # unless e01.subset?(e00) || e01.subset?(e10) || e01.proper_subset?(e11)
  #   ijs << [i + 0, j + 1]
  # end

  # unless e11.subset?(e00) || e11.subset?(e10) || e11.subset?(e01)
  #   ijs << [i + 1, j + 1]
  # end

  unless ((e10 & e00) == e00 && e10 != e00) || ((e01 & e00) == e00 && e01 != e00) || ((e11 & e00) == e00 && e11 != e00)
    ijs << [i + 0, j + 0]
  end

  unless ((e00 & e10) == e10) || ((e01 & e10) == e10 && e01 != e10) || ((e11 & e10) == e10 && e11 != e10)
    ijs << [i + 1, j + 0]
  end

  unless ((e00 & e01) == e01) || ((e10 & e01) == e01) || ((e11 & e01) == e01 && e11 != e01)
    ijs << [i + 0, j + 1]
  end

  unless ((e00 & e11) == e11) || ((e10 & e11) == e11) || ((e01 & e11) == e11)
    ijs << [i + 1, j + 1]
  end


  pp(ijs:) if $debug

  rs = []
  ijs.each do |i1, j1|
    exist_squares2 = exist_squares.dup
    effects2 = effects.dup

    DIJS.each do |di, dj|
      i2 = i1 - di
      j2 = j1 - dj
      if 0 <= i2 && 0 <= j2 && exist_squares2[i2 * w + j2]
        exist_squares2[i2 * w + j2] = false
        # effects2[i2 * w + j2] = effects2[i2 * w + j2].dup
        # effects2[i2 * w + j2].delete([i1, j1])
        effects2[i2 * w + j2] = effects2[i2 * w + j2] & (((1 << (h * w)) - 1) - (1 << (i * w + j)))
      end
    end

    rs << calc_one(h, w, squares[1..], exist_squares2, effects2)
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
  effects = Array.new(h * w, 0)
  (0...(h - 1)).each do |i|
    (0...(w - 1)).each do |j|
      if DIJS.all? { |di, dj| ss[i + di][j + dj] }
        squares << [i, j]
        exist_squares[i * w + j] = true
        DIJS.each do |di, dj|
          effects[(i + di) * w + (j + dj)] = effects[(i + di) * w + (j + dj)] | (1 << (i * w + j))
        end
      end
    end
  end

  calc_one(h, w, squares, exist_squares, effects)
end



T.times do
  puts calc
end



