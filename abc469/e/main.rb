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



def check_one(p, cs)
  cs = S.chars
  pp(cs:) if $debug
  as = cs.map { |c| c == 'o' ? 1 - p : -p }
  pp(as:) if $debug
  
  ois = []
  cs.each.with_index do |c, i|
    ois << i if c == 'o'
  end
  pp(ois:) if $debug

  ss = [0]
  min_ss = [0]
  a_sum = 0
  min_s = 0
  as.each do |a|
    a_sum += a
    ss << a_sum
    min_s = a_sum if a_sum < min_s
    min_ss << min_s
  end
  pp(ss:) if $debug
  pp(min_ss:) if $debug

  len = ois.length
  # return false if l < K

  ((K - 1)...len).each do |i|
    pp(i:) if $debug
    r = ois[i]
    l = ois[i - (K - 1)]
    pp(l:, r:) if $debug
    sr = ss[r + 1]
    # sl_1 = ss[l - 1]
    min_s_l_1 = min_ss[l - 1 + 1]
    pp(l:, r:, sr:, min_s_l_1:) if $debug
    return true if min_s_l_1 <= sr
  end

  false
end

def calc
  cs = S.chars.map { |c| c == 'o' ? 1 : 0 }

  a_max = (0..(10 ** 6)).bsearch do |a|
    p = a.to_f / (10 ** 6)
    ans = check_one(p, cs)
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
