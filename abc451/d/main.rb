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





def calc_l(l, gs, gls)
  return 1 if l == 0

  (1..l).each do |l2|
    gs[l].length * calc_l(l - l2, gs)
  end
end

def calc_m(n, gs, gls) # その数以下の良い整数の数を求める
  pp(n:) if $debug
  s = n.to_s
  l = s.length

  r = 0
  gls.each do |l2, ts|
    pp(l2:, ts:)
    next if l < l2
    ts.each do |t|
      pp(s[0...l2])
      pp(t)
      if s[0...l2].to_i == t.to_i
        r += calc_m(s[(l2 + 1)..], gs, gls)
      elsif s[0...l2].to_i > t.to_i
        r += calc_l(l - l2, gs, gls)
      else
      end
    end
  end

  pp(n:, r:) if $debug
  r
end


r = (1..(10 ** 9)).bsearch { |n| N <= calc_m(n, gs, gls) }


puts r

