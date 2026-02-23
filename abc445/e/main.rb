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



def create_spf
  spf = (0..(10 ** 7)).to_a

  n = 10 ** 7
  n2 = Math.sqrt(n).to_i

  (2..n2).each do |i|
    if spf[i] == i
      (i..n).step(i) do |j|
        spf[j] = i
      end
    end
  end
  spf
end

$spf = create_spf
pp($spf) if $debug


def prime_division(a)
  # a.prime_division

  ls =  {}
  while a != 1
    s = $spf[a]
    ls[s] ||= 0
    ls[s] += 1
    a /= s
  end

  ls
end

def from_prime_division(ls)
  ls.map { |p, i| p.pow(i, M) }.inject { |r, a| (r * a) % M }
end

def calc()
  n = STDIN.gets.chomp.to_i
  as = STDIN.gets.chomp.split.map(&:to_i)
  pp(n:, as:) if $debug

  ps = {}
  pds = as.map do |a|
    prime_division(a)
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

    # rs << Integer.from_prime_division(ls2) % M
    rs << from_prime_division(ls2)
    pp(rs:) if $debug
  end

  rs
end



T.times do
  ans = calc()
  puts ans.join(' ')
end

