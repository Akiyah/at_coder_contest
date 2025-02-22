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

N = STDIN.gets.chomp.to_i
CS = (1..N).map do
  STDIN.gets.chomp.split('')
end


pp({N:, CS:}) if $debug


def calc
  m = 0
  cs = [] # i, j, char
  (0...N).each do |i|
    (0...N).each do |i|
      cs << [i, j, CS[i][j]] if CS[i][j] != '-'
    end
  end
  pp({cs:}) if $debug

  # 0歩
  rs = Array.new(N) { Array.new(N) }
  (0...N).each do |i|
    rs[i][i] = 0
    m += 1
  end
  pp({rs:}) if $debug

  # 1歩、この時点では回分確定
  ss = Array.new(N) { Array.new(N) { [] } }
  cs.each do |i, j, c|
    ss[i][j] << c
    unless rs[i][j]
      rs[i][j] = 1
      m += 1
    end
  end
  pp({rs:, ss:}) if $debug

  # 2歩以降
  d = 2
  while d <= 2 * N
    ss2 = Array.new(N) { Array.new(N) { [] } }
    ss3 = Array.new(N) { Array.new(N) { [] } }
    cs.each do |i, j, c|
      cs.each do |i2, j2, c2|

      end
      
      if CS[k][j] != '-'
        ss2[i][j] += ss[i][k].map { |r| r + CS[k][j] }
      end

    end


    (0...N).each do |i|
      (0...N).each do |j|
        (0...N).each do |k|
          if CS[k][j] != '-'
            ss2[i][j] += ss[i][k].map { |r| r + CS[k][j] }
          end
        end
        unless rs[i][j]
          if ss2[i][j].any? { |s| s == s.reverse }
            rs[i][j] = d
          end
        end
      end
    end
    ss = ss2
    pp({d:, rs:, ss:}) if $debug
    d += 1
  end

  rs
end


rs = calc
rs.each do |line|
  puts line.map {|r| r || -1}.join(' ')
end

