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

N, M = STDIN.gets.chomp.split.map(&:to_i)
ABS = (1..M).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc
  r = 0

  abs_count = {}
  # 全てに含まれているものがあるか探す
  ABS.each do |a, b|
    abs_count[a] ||= 0
    abs_count[a] += 1
    abs_count[b] ||= 0
    abs_count[b] += 1
  end
  pp(abs_count:) if $debug

  lines = []
  abs_count.each do |a, co|
    lines << a if co == M
  end

  pp(lines:) if $debug
  if lines.length == 2 # 二種類ですべてがカバーされてる
    pp(type: 1) if $debug
    return (N - 1) + (N - 2)
  elsif lines.length == 1
    if abs_count.keys.length == 3 # その他の2つでもカバーしている場合
      pp(type: 2) if $debug
      return (N - 1) + 1
    else
      pp(type: 3) if $debug
      return (N - 1)
    end
  end


  # 全てに含まれているものがない場合
  xys = []
  a0, b0 = ABS[0]
  pp(a0:, b0:) if $debug
  # a0
  bs = nil
  ABS.each do |a, b|
    if a == a0 || b == a0
    else
      if !bs
        bs = {}
        bs[a] = true
        bs[b] = true
      else
        ks = bs.keys
        ks.each do |k|
          if k == a || k == b
          else
            bs.delete(k)
          end
        end
      end
    end
  end
  pp(bs:) if $debug
  bs.keys.each do |b|
    xys << [a0, b]
  end

  # b0
  as = nil
  ABS.each do |a, b|
    if a == b0 || b == b0
    else
      if !as
        as = {}
        as[a] = true
        as[b] = true
      else
        ks = as.keys
        ks.each do |k|
          if k == a || k == b
          else
            as.delete(k)
          end
        end
      end
    end
  end
  pp(as:) if $debug
  as.keys.each do |a|
    xys << [a, b0]
  end
  pp(xys:) if $debug

  xys = xys.map { |a, b| a, b = b, a unless a < b; [a, b] }.uniq
  pp(xys:) if $debug

  xys.length
end




r = calc
puts r
