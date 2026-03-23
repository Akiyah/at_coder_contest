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

X = STDIN.gets.chomp
Y = STDIN.gets.chomp
Q = STDIN.gets.chomp.to_i
LRCS = (1..Q).map do
  l, r, c = STDIN.gets.chomp.split
  [l.to_i, r.to_i, c]
end

pp(X:, Y:, Q:, LRCS:) if $debug


r_max = LRCS.map { |l, r, c| r }.max

# xs = X.chars.tally
# xs.default = 0
# ys = Y.chars.tally
# ys.default = 0

xs = {}
('a'..'z').each do |c|
  n = 0
  xs[c] = X.chars.map do |cx|
    n += 1 if cx == c
    n
  end
end
ys = {}
('a'..'z').each do |c|
  n = 0
  ys[c] = Y.chars.map do |cy|
    n += 1 if cy == c
    n
  end
end

lx = X.length
ly = Y.length

cxys = []
ls = []
ls << lx
ls << ly
cxys << [1, 0]
cxys << [0, 1]
while true do
  cx1, cy1 = cxys[-1]
  cx2, cy2 = cxys[-2]
  cx, cy = cx1 + cx2, cy1 + cy2
  cxys << [cx, cy]
  ls << cx * X.length + cy * Y.length
  break if r_max < ls[-1]
end

pp(cxys:) if $debug
pp(ls:) if $debug

def calc(r, c, ls, cxys, xs, ys)
  pp(r:, c:) if $debug
  return 0 if r <= 0

  i = ls.length - 1
  ans = 0
  while true do
    if i == 0
      ans += xs[c][r - 1] # X.chars[0...r].tally[c] || 0
      pp(i:, r:, ans:, type: 'a') if $debug
      return ans
    end
    if i == 1
      ans += ys[c][r - 1] # Y.chars[0...r].tally[c] || 0
      pp(i:, r:, ans:, type: 'b') if $debug
      return ans
    end
    if r <= ls[i - 1]
      pp(i:, r:, ans:, type: 'c') if $debug
      i -= 1
      next
    end

    cx, cy = cxys[i - 1]
    ans += cx * xs[c][-1] + cy * ys[c][-1]
    pp(i:, r:, ans:, type: 'd') if $debug
    r -= ls[i - 1]
    i -= 2
  end

  ans
end


LRCS.each do |l, r, c|
  pp(l:, r:, c:) if $debug
  ans1 = calc(r, c, ls, cxys, xs, ys)
  ans2 = calc(l - 1, c, ls, cxys, xs, ys)
  pp(ans1:, ans2:) if $debug
  puts ans1 - ans2
end

# 0:a
# 1:b
# 2:ba
# 3:bab
# 4:babba
# 5:babbabab
#   12345678
#   01234567

