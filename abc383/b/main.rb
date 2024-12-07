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


H, W, D = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp.split('')
end

pp [H, W, SS] if $debug

def count_tiles(i, j)
  return [] if SS[i][j] == '#'

  tiles = [[i, j]]
  (0..D).each do |a|
    d = D - a
    (1..d).each do |b|
      pp ['i', i, 'j', j, 'a', a, 'b', b] if $debug
      tiles << [i + a, j + b] if i + a < H  && j + b < W  && SS[i + a][j + b] == '.'
      tiles << [i - b, j + a] if 0 <= i - b && j + a < W  && SS[i - b][j + a] == '.'
      tiles << [i - a, j - b] if 0 <= i - a  && 0 <= j - b && SS[i - a][j - b] == '.'
      tiles << [i + b, j - a] if i + b < H && 0 <= j - a && SS[i + b][j - a] == '.'
      pp tiles if $debug
    end
  end
  tiles
end

def calc
  tiles_list = []
  (0...H).each do |i|
    tiles_list[i] = []
    (0...W).each do |j|
      tiles_list[i][j] = count_tiles(i, j)
      pp [i, j, tiles_list[i][j]] if $debug
    end
  end

  pp "---" if $debug

  r = 0
  (0...H).each do |i1|
    (0...W).each do |j1|
      (0...H).each do |i2|
        (0...W).each do |j2|
          next  if i1 == i2 && j1 == j2
          tiles = tiles_list[i1][j1] + tiles_list[i2][j2]
          pp [[i1, j1], [i2, j2], tiles_list[i1][j1], tiles_list[i2][j2], tiles, tiles.uniq, tiles.uniq.count] if $debug
          r = [r, tiles.uniq.count].max
        end
      end
    end
  end

  r
end

puts calc
