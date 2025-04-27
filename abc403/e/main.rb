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
zs = [] # yはxsのどれも接頭詞として持たない
r = 0
l = 0
TSS.each do |t, s|
  if t == '1'
    xs << s # 新しい接頭詞

    (0...l).each do |i|
      if zs[i] && ys[i].start_with?(s)
        zs[i] = false
        r -= 1
      end
    end
  else
    ys << s # 新しい文字列
    l += 1

    if xs.all? { |x| !s.start_with?(x) }
      zs << true
      r += 1
    else
      zs << false
    end
  end
  pp({xs:, ys:}) if $debug

  puts r
end

