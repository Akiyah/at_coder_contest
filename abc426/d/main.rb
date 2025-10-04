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

T = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


def calc1_one(cs) # すべてを1にする
  pp(cs:) if $debug
  if cs.length == 1
    if cs[0][0] == 1
      return true, nil, 0
    else
      return true, nil, cs[0][1]
    end
  end

  if cs[0][0] == 0 # 先頭が0の場合
    s, c = cs.shift
    # どこかの1にくっつける
    return false, cs, c
  end

  if cs[-1][0] == 0 # 末尾が0の場合
    s, c = cs.pop
    # どこかの1にくっつける
    return false, cs, c
  end


  # 前も後ろも1の場合、短い方を0にする
  if cs[0][1] < cs[-1][1]
    s, c = cs.shift
    cs[0][1] += c # つぎの1にくっつける
    return false, cs, c
  else
    s, c = cs.pop
    cs[-1][1] += c # まえの1にくっつける
    return false, cs, c
  end
end

def calc1(ss) # すべてを1にする
  cs = []
  ss.each do |s|
    if cs[-1] && s == cs[-1][0]
      cs[-1][1] += 1
    else
      cs << [s, 1]
    end
  end

  pp(ss:, cs:) if $debug

  m = 0
  while true
    r, cs0, m0 = calc1_one(cs)
    pp(r:, cs0:, m0:) if $debug
    m += m0
    cs = cs0
    pp(cs:, m:) if $debug

    return m if r
  end
end


def calc(n, ss)
  r0 = calc1(ss)
  pp(r0:) if $debug
  ss1 = ss.map { |s| 1 - s }
  r1 = calc1(ss1)
  pp(r1:) if $debug
  [r0, r1].min
end



T.times do
  n = STDIN.gets.chomp.to_i
  ss = STDIN.gets.chomp.split('').map(&:to_i)
  puts calc(n, ss)
end








