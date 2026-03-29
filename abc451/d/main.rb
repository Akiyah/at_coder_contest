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



def check(s, gs)
  # pp(s:) if $debug
  l = s.length
  (0...l).each do |i|
    s1 = s[0..i]
    if gs[s1] # 先頭i文字がgsに含まれていた
      if i == l - 1 # 残り文字数がない場合
        return true
      else
        return check(s[(i + 1)..], gs)
      end
    end
  end
  false
end


gs = {}
gls = {}
(0..29).each do |i| # 2 ** 30 > 10 ** 9
  s = (2 ** i).to_s
  r = check(s, gs)

  # pp([i, s, r]) if $debug

  pp([i, s, r]) if r && $debug

  if !r
    gs[s] = true
    l = s.length
    gls[l] ||= []
    gls[l] << s
  end
end


# pp(gs:) if $debug
# pp(l: gs.length) if $debug
pp(gls:) if $debug





def calc_keta(l, gls) # ちょうどその桁数の良い整数の数
  return 1 if l == 0

  r = 0
  gls.each do |l2, gs|
    if l2 <= l
      r += gs.length * calc_keta(l - l2, gls)
    end
  end
  r
end

def calc_kazu(s, gls) # その数以下で同じ桁数の良い整数の数
  l = s.length
  return 1 if l == 0

  r = 0
  gls.each do |l2, gs|
    if l2 <= l
      gs.each do |g|
        if g == s[...l2]
          r += calc_kazu(s[l2..], gls)
        elsif g < s[...l2]
          r += calc_keta(l - l2, gls)
        end
      end
    end
  end
  r
end

def calc_m(n, gls) # その数以下の良い整数の数を求める
  # pp(n:) if $debug
  s = n.to_s
  l = s.length

  r = 0
  r1 = calc_kazu(s, gls)
  # pp(r1:) if $debug
  r += r1
  (1...l).each do |l2|
    r2 = calc_keta(l2, gls)
    # pp(l2:, r2:) if $debug
    r += r2
  end

  # pp(n:, r:) if $debug
  r
end


r = (1..(10 ** 9)).bsearch { |n| N <= calc_m(n, gls) }


puts r



if $debug
  r0 = 0
  (1..400).each do |n|
    r = calc_m(n, gls)
    pp(n:, r:) if r0 != r
    r0 = r
  end
end

