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

N, M, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)



def calc

  eated = []

  total = 0
  N.times do |i|
    pp(i:, total:) if $debug
    if 0 <= i - M && eated[i - M]
      total -= AS[i - M]
    end
    pp(i:, total:, 'total + AS[i]' => total + AS[i], K:) if $debug

    if total + AS[i] <= K
      puts 'Yes'
      total += AS[i]
      eated[i] = true
    else
      puts 'No'
    end
  end
end


calc
