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
  sp = -p
  sp_1 = -1 # sp + p == sp_1 + 1
  sp_1_min = 1
  sps = []
  sp_1_mins = []
  last_i = -1

  len = ois.length

  (0...(K - 1)).each do |j|
    i = ois[j]
    d = i - last_i
    sp += 1 - p * d
    sp_1_min = [sp_1_min, sp + p - 1].min

    sps << sp
    sp_1_mins << sp_1_min
    last_i = i
  end

  ((K - 1)...len).each do |j|
    i = ois[j]
    d = i - last_i
    sp += 1 - p * d
    sp_1_min = [sp_1_min, sp + p - 1].min

    sps << sp
    sp_1_mins << sp_1_min
    last_i = i

    sp_ = sps[j]
    sp_1_min_ = sp_1_mins[j - (K - 1)]
    return true if sp_1_min_ <= sp_
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
