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

ss = []
N.times do |i|
  ss[i] = []
  N.times do |j|
    if [i, j, N - i - 1, N - j - 1].min % 2 == 0
      ss[i][j] = '#'
    else
      ss[i][j] = '.'
    end
  end
end


N.times do |i|
  puts ss[i].join('')
end
