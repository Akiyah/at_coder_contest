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

H, W = STDIN.gets.chomp.split.map(&:to_i)
SS = (1..H).map do
  STDIN.gets.chomp
end

def takahashi
  SS.each.with_index do |s, i|
    s.split('').each_with_index do |c, j|
      if c == 'T'
        return [i, j]
      end
    end
  end
end

def calc
  dusts = SS.map do |s|
    s.split('').map { |c| c == '#' }
  end

  t = takahashi

  dust_count = 0
  dusts.each do |line|
    line.each do |d|
      dust_count += 1 if d
    end
  end

  dp = []
  dp << [t, [0, H - 1, 0, W - 1], dust_count]

  calced = {}
  while 0 < dp.length



  end


  -1
end







puts calc



