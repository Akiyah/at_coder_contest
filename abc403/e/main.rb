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
ys = { count: 0 }

def remove_start_with(ys, ss)
  pp({ys:, ss:}) if $debug
  if 1 < ss.length
    y = ys.dig(*ss[...-1])
  else
    y = ys
  end
  return unless y

  return unless y[ss[-1]]

  c = y[ss[-1]][:count]
  y.delete(ss[-1])

  ys2 = ys
  ss.each do |s|
    ys2[:count] -= c
    ys2 = ys2[s]
  end
end

def update_ys(ys, ss)
  ys2 = ys
  ys2[:count] += 1
  ss.each do |s|
    ys2[s] ||= { count: 0 }
    ys2[s][:count] += 1
    ys2 = ys2[s]
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
  # n = ss.length
  xs2 = xs
  ss.each do |s|
    xs2 = xs2[s]
    return false unless xs2
    return true if xs2[:edge]
  end
  false
end

ls = []
# l = 0
TSS.each do |t, s|
  if t == '1'
    # 新しい接頭詞
    update_xs(xs, s.chars)

    # ys, dl = remove_start_with(ys, l, s)
    remove_start_with(ys, s.chars)
    # l -= dl
  else
    r = has_edge?(xs, s.chars)

    if !r
      # 新しい文字列
      # ys = insert(ys, s)
      update_ys(ys, s.chars)
      # l += 1
    end
  end
  pp({xs:, ys:, t:, s:}) if $debug

  # pp 'error' unless ys.length == l
  ls << ys[:count]
end

puts ls
