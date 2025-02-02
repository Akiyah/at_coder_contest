#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N, Q = STDIN.gets.chomp.split.map(&:to_i)
QUERYS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


birds = {} # はとの巣のいち
(1..N).each do |i|
  birds[i] = i
end

boxs = {} # 巣のはと
(1..N).each do |i|
  boxs[i] = [i]
end

num = 0

QUERYS.each do |type, p, h|
  if type == 1
    h_old = birds[p]
    if boxs[h_old].length == 2
      num -= 1
    end
    boxs[h_old].delete(p)

    birds[p] = h
    if boxs[h].length == 1
      num += 1
    end
    boxs[h] << p
  else
    puts num
  end
  pp [[type, p, h], h, birds, boxs] if $debug
end






