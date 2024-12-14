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

H, W, X = STDIN.gets.chomp.split.map(&:to_i)
P, Q = STDIN.gets.chomp.split.map(&:to_i)

SS = (1..H).map do
  STDIN.gets.chomp.split.map(&:to_i)
end



def calc()
  ts = [[P - 1, Q - 1]]
  power = SS[P - 1][Q - 1]

  while true
    new_ts = []
    (0...H).each do |i|
      (0...W).each do |j|
        next if ts.include?([i, j]) ||  power <= SS[i][j] * X
        pp [i, j] if $debug
        new_ts << [i, j] if i + 1 < H && ts.include?([i + 1, j])
        new_ts << [i, j] if j + 1 < W && ts.include?([i, j + 1])
        new_ts << [i, j] if 0 <= i - 1 && ts.include?([i - 1, j])
        new_ts << [i, j] if 0 <= j - 1 && ts.include?([i, j - 1])
        pp [ts, new_ts] if $debug
      end
    end

    return power if new_ts.length == 0
    new_ts.uniq!
    new_ts.each do |i, j|
      power += SS[i][j]
    end
    ts += new_ts
    pp [ts, power] if $debug
  end
  
end


puts calc
