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

xs = []
ys = []

def insert(xs, s)
  i = xs.bsearch_index { |x| s < x }
  if i
    xs[0...i] + [s] + xs[i..-1]
  else
    xs + [s]
  end
end

TSS.each do |t, s|
  if t == '1'
    # 新しい接頭詞
    xs = insert(xs, s)

    i = ys.bsearch_index { |y| s <= y }
    if i
      j = ys[i..].bsearch_index { |y| !y.start_with?(s) }
      if j
        ys = ys[0...i] + ys[(i + j)..]
      else
        ys = ys[0...i]
      end
      # ys = ys.select { |y| !y.start_with?(s) } # todo
    end
  else
    # r = xs.all? { |x| !s.start_with?(x) } # todo
    r = (0...(s.length)).any? do |i|
      s2 = s[0..i]
      i = xs.bsearch_index { |x| s2 < x }
      if i
        s2 == xs[i - 1]
      else
        s2 == xs[-1]
      end
    end

    if !r
      # 新しい文字列
      ys = insert(ys, s)
    end
  end
  pp({xs:, ys:, t:, s:}) if $debug

  puts ys.length
end

