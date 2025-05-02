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

Q = STDIN.gets.chomp.to_i
TSS = (1..Q).map do
  STDIN.gets.chomp.split
end

xs = {}
ys = []

def insert(ys, new_y)
  i = ys.bsearch_index { |y| new_y < y }
  if i
    ys[0...i] + [new_y] + ys[i..-1]
  else
    ys + [new_y]
  end
end

def remove_start_with(ys, s)
  i = ys.bsearch_index { |y| s <= y }
  return ys unless i

  j = ys[i..].bsearch_index { |y| !y.start_with?(s) }
  if j
    ys[0...i] + ys[(i + j)..]
  else
    ys[0...i]
  end
end

def update_xs(xs, ss)
  xs2 = xs
  ss.each do |s|
    xs2[s] ||= {}
    xs2 = xs2[s]
  end
  xs2[:edge] = true
end

def has_edge?(xs, ss)
  n = ss.length
  xs2 = xs
  ss.each do |s|
    xs2 = xs2[s]
    return false unless xs2
    return true if xs2[:edge]
  end
end

TSS.each do |t, s|
  if t == '1'
    # 新しい接頭詞
    update_xs(xs, s.chars)

    ys = remove_start_with(ys, s)
  else
    r = has_edge?(xs, s.chars)

    if !r
      # 新しい文字列
      ys = insert(ys, s)
    end
  end
  pp({xs:, ys:, t:, s:}) if $debug

  puts ys.length
end

