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
# zs = [] # yはxsのどれも接頭詞として持たない
r = 0
TSS.each do |t, s|
  if t == '1'
    # xs << s # 新しい接頭詞
    i = xs.bsearch_index { |x| s < x }
    if i
      xs = xs[0...i] + [s] + xs[i..-1]
    else
      xs = xs + [s]
    end

    ys.each do |yz|
      y, z = yz
      if z && y.start_with?(s)
        yz[1] = false
        r -= 1
      end
    end
  else
    z = xs.all? { |x| !s.start_with?(x) }
    if z
      r += 1
    end

    # ys << [s, z] # 新しい文字列
    i = ys.bsearch_index { |y, z| s < y }
    if i
      ys = ys[0...i] + [[s, z]] + ys[i..-1]
    else
      ys = ys + [[s, z]]
    end
  end
  pp({xs:, ys:, t:, s:, r:}) if $debug

  puts r
end

