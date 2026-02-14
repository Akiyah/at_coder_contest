#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

# pq = AcLibraryRb::PriorityQueue.new

require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

M = 998244353

T = STDIN.gets.chomp.to_i


def calc()
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)
  pp(n:, as:) if $debug

  ps = {}
  pds = as.map do |a|
    Prime.prime_division(a)
  end

  ls_2 = {}
  ls = {}
  pds.each do |pd|
    pd.each do |p, i|
      if ls_2[p]
        if ls_2[p][0] < i
          ls_2[p].unshift(i)
          ls[p] = i
        elsif !ls_2[p][1] || ls_2[p][1] < i
          ls_2[p][1] = i
        else
        end
      else
        ls_2[p] = [i]
        ls[p] = i
      end
    end
  end

  pp(ls:) if $debug
  pp(ls_2:) if $debug

  rs = []
  pds.each do |pd|
    ls2 = ls.dup
    pd.each do |p, i|
      if ls_2[p][0] == i
        if ls_2[p][1]
          ls2[p] = ls_2[p][1]
        else
          ls2[p] = 0
        end
      else
        ls2[p] = ls_2[p][0]
      end
    end

    pp(ls2:) if $debug

    rs << Integer.from_prime_division(ls2) % M
    pp(rs:) if $debug
  end

  rs
end



T.times do
  ans = calc()
  puts ans.join(' ')
end

