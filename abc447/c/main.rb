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

S = STDIN.gets.chomp
T = STDIN.gets.chomp

def calc
  ss = S.chars
  tt = T.chars

  i = 0
  j = 0
  ans = 0

  while true
    pp(i:, j:, ans:, s: ss[i], t: tt[j]) if $debug
    if ss[i] == 'A' && tt[j] != 'A' 
      i += 1
      ans += 1
      next
    end

    if ss[i] == 'A' && tt[j] == 'A' 
      i += 1
      j += 1
      next
    end

    if ss[i] != 'A' && tt[j] == 'A' 
      j += 1
      ans += 1
      next
    end

    if ss[i] != 'A' && tt[j] != 'A' 
      return -1 if ss[i] != tt[j]
      return ans if ss.length <= i && tt.length <= j

      i += 1
      j += 1
      next
    end
  end

  ans
end



puts calc
