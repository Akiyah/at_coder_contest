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
AS = STDIN.gets.chomp.split.map(&:to_i)



def calc_one(i, j)
  del = 1
  while true
    if 0 <= i - 1 && j + 3 < N && AS[i - 1] == AS[j + 1] && AS[i - 1] == AS[j + 2] && AS[i - 1] == AS[j + 3]
      i = i - 1
      j = j + 3
      del += 1
    elsif 0 <= i - 2 && j + 2 < N && AS[i - 2] == AS[i - 1] && AS[i - 2] == AS[j + 1] && AS[i - 2] == AS[j + 2]
      i = i - 2
      j = j + 2
      del += 1
    elsif 0 <= i - 3 && j + 1 < N && AS[i - 3] == AS[i - 2] && AS[i - 3] == AS[i - 1] && AS[i - 3] == AS[j + 1]
      i = i - 3
      j = j + 1
      del += 1
    else
      return [j, del]
    end
  end
end

def calc
  i = 0
  del = 0
  while i + 3 < N
    if AS[i] == AS[i + 1] && AS[i] == AS[i + 2] && AS[i] == AS[i + 3]
      i2, del2 = calc_one(i, i + 3)
      i = i2
      del += del2
    end
    i += 1
  end

  N - del * 4
end



puts calc()

