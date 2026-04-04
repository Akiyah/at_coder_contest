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

def calc_one(lss, ps)
  pp(lss:, ps:) if $debug
  return [] unless ps
  return [] if lss.length == 0
  new_lss = []
  j = 0
  last_j = nil
  ps.each do |p|
    pp(p:, 'lss[j]' => lss[j]) if $debug
    while j < lss.length && lss[j][-1] < p
      j += 1
    end
    pp(p:, j:, last_j:) if $debug
    if j != last_j
      if 0 < j && j - 1 < lss.length
        new_lss << lss[j - 1]
        new_lss[-1] << p
        pp(new_lss:) if $debug
      end
      last_j = j
    end
  end
  new_lss
end

def calc()
  ss = S.chars
  ts = T.chars
  l_s = ss.length
  l_t = ts.length

  ps = {}
  ss.each.with_index do |s, i|
    ps[s] ||= []
    ps[s] << i
  end

  pp(ps:) if $debug

  lss = [] # start地点からの数列の配列
  ts.each.with_index do |t, i|
    if i == 0
      if ps[t]
        lss = ps[t].map { |p| [p] }
      else
        lss = []
      end
      pp(t:, lss:) if $debug
    else
      lss = calc_one(lss, ps[t])
      pp(t:, lss:) if $debug
   end
  end

  pp(lss:) if $debug


  ans = 0
  last_ls = nil
  lss.each do |ls|
    if last_ls
      ans += (ls[0] - last_ls[0]) * (l_s - ls[-1])
    else
      ans += (ls[0] + 1) * (l_s - ls[-1])
    end

    last_ls = ls
  end

  l_s * (l_s + 1) / 2 - ans
end





puts calc()


