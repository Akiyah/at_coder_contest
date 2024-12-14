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

A, B, C, D, E = STDIN.gets.chomp.split.map(&:to_i)



rs = []
(0..1).each do |a|
  (0..1).each do |b|
    (0..1).each do |c|
      (0..1).each do |d|
        (0..1).each do |e|
          score = a * A + b * B + c * C + d * D + e * E
          next if score == 0
          name = (a == 0 ? '' : 'A') + (b == 0 ? '' : 'B') + (c == 0 ? '' : 'C') + (d == 0 ? '' : 'D') + (e == 0 ? '' : 'E')
          rs << [score, name]
        end
      end
    end
  end
end

pp rs if $debug

rs2 = rs.sort{|(score1, name1), (score2, name2)| score1 == score2 ? name1 <=> name2 : score2 <=> score1  }
pp rs2 if $debug
rs2.each do |score, name|
  puts name
end
