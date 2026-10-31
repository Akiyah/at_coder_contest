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
S = STDIN.gets.chomp



def check_one(p, as, ois)
  sp = nil
  sp_1 = nil
  sp_1_min = nil
  sps = []
  sp_1_mins = []
  last_i = nil
  ois.each do |i|
    if last_i == nil
      d = i + 1
      sp = 1 - p * (d + 1)
      sp_1 = - p * d
      sp_1_min = sp_1
    else
      d = i - last_i
      sp = sp + 1 - p * d
      sp_1 = sp_1 + 1 - p * d
      sp_1_min = [sp_1_min, sp_1].min
    end
    sps << sp
    sp_1_mins << sp_1_min
    last_i = i
  end

  len = ois.length

  ((K - 1)...len).each do |i|
    pp(i:) if $debug
    sp = sps[i]
    sp_1_min = sp_1_mins[i - (K - 1)]
    return true if sp_1_min <= sp
  end

  false
end

def calc
  as = S.chars.map { |c| c == 'o' ? 1 : 0 }

  ois = []
  as.each.with_index do |a, i|
    ois << i if a == 1
  end
  pp(ois:) if $debug

  a_max = (0..(10 ** 6)).bsearch do |a|
    p = a.to_f / (10 ** 6)
    ans = check_one(p, as, ois)
    pp(a:, p:, ans:) if $debug
    !ans
  end

  pp(a_max:) if $debug
  unless a_max
    return 1
  end
  a_max.to_f / (10 ** 6)
end

ans = calc()
if ans == 1
  ans = 1
end
puts ans
