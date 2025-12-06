#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"


# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
XYS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end
Q = STDIN.gets.chomp.to_i


def update(paths, colors, new_blacks)
  vs = []
  new_blacks.each do |v|
    unless colors[v]
      colors[v] = true
      vs << v
    end
  end

  while !vs.empty?
    v = vs.shift
    colors[v] = true
    if paths[v]
      paths[v].each do |v2|
        vs << v2 unless colors[v2]
      end
    end
  end
end

paths = {} # 逆方向のパス
XYS.each do |x, y|
  paths[y - 1] ||= []
  paths[y - 1] << x - 1
end
colors = [] # true = black
new_blacks = []

Q.times do
  t, v = STDIN.gets.chomp.split.map(&:to_i)
  if t == 1
    new_blacks << v - 1
  else
    update(paths, colors, new_blacks)
    new_blacks = []
    puts colors[v - 1] ? 'Yes' : 'No'
  end
end
