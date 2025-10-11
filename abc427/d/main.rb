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

T = STDIN.gets.chomp.to_i

def calc_one(n, m, k, s, uvs)
  pp(n:, m:, k:, s:) if $debug
  paths = []
  uvs.each do |u, v|
    paths[u - 1] ||= []
    paths[u - 1] << v - 1
  end
  rpaths = []
  uvs.each do |u, v|
    rpaths[v - 1] ||= []
    rpaths[v - 1] << u - 1
  end

  bs = s.chars.map { |c| c == 'A' }
  # 0手の場合のアリス必勝の場所
  pp(bs:) if $debug

  k.times do
    # ボブの手順での必ず負けてしまう場所=必ずAに行ってしまうかどうか
    bs2 = n.times.map do |u|
      paths[u].all? { |v| bs[v] }
    end

    # アリスの手順での勝てる場所
    bs3 = n.times.map do |u|
      paths[u].any? { |v| bs2[v] }
    end

    bs = bs3
    pp(bs:) if $debug
  end

  bs[0]
end

def calc
  n, m, k = STDIN.gets.chomp.split.map(&:to_i)
  s = STDIN.gets.chomp
  uvs = (1..m).map do
    STDIN.gets.chomp.split.map(&:to_i)
  end

  calc_one(n, m, k, s, uvs)
end


T.times do
  puts calc ? 'Alice' : 'Bob'
end



