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
  STDIN.gets.chomp.split('')
end

def calc()
  H.times do |i|
    W.times do |j|
      if SS[i][j] == '#'
        c = 0
        c += 1 if 0 < i && SS[i - 1][j] == '#'
        c += 1 if i < H - 1 && SS[i + 1][j] == '#'
        c += 1 if 0 < j && SS[i][j - 1] == '#'
        c += 1 if j < W - 1 && SS[i][j + 1] == '#'
        return false unless c == 2 || c == 4
      end
    end
  end
end

puts calc ? 'Yes' : 'No'

