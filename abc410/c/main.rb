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

N, Q = STDIN.gets.chomp.split.map(&:to_i)

def calc
  as = N.times.map { |i| i + 1 }
  pp(as:) if $debug
  index = 0

  Q.times do
    t, a, b = STDIN.gets.chomp.split.map(&:to_i)

    if t == 1
      p = a
      x = b
      as[(p - 1 + index) % N] = x
    elsif t == 2
      p = a

      puts as[(p - 1 + index) % N]
    else # t == 3
      k = a

      index = (index + k) % N
    end

  end


  as
end

calc
