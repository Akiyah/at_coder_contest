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
TSS.each do |t, s|
  if t == '1'
    # 新しい接頭詞
    i = xs.bsearch_index { |x| s < x }
    if i
      xs = xs[0...i] + [s] + xs[i..-1]
    else
      xs = xs + [s]
    end

    ys = ys.select { |y| !y.start_with?(s) }
  else
    if xs.all? { |x| !s.start_with?(x) }
      # 新しい文字列
      i = ys.bsearch_index { |y| s < y }
      if i
        ys = ys[0...i] + [s] + ys[i..-1]
      else
        ys = ys + [s]
      end
    end
  end
  pp({xs:, ys:, t:, s:, r:}) if $debug

  puts ys.length
end

