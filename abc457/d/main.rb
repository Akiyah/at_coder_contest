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

N, K = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)


def calc_one(m)
  k = 0
  AS.each.with_index do |a, i|
    if a < m
      if (m - a) % (i + 1) == 0
        k += (m - a) / (i + 1)
      else
        k += (m - a) / (i + 1) + 1
      end
    end
  end
  k
end

def calc
  min_m_over = (1..(10 ** 18 * 2 + 1)).bsearch do |m|
    K < calc_one(m)
  end

  min_m_over - 1
end

puts calc()
