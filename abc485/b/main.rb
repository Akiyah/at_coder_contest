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
SS = (1..N).map do
  STDIN.gets.chomp
end

def calc
  SS.each.with_index do |s, i|
    if s == 'x' * M
      return ['Faucet', i + 1]
    end
  end

  M.times do|j|
    if SS.map { |s| s[j] }.join('') == 'x' * N
      return ['Drain', j + 1]
    end
  end
end



name, i = calc
puts [name, i].join(' ')




