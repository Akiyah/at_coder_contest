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

xs = X.chars.tally
xs.default = 0
ys = Y.chars.tally
ys.default = 0

lx = X.length
ly = Y.length

lxys = []
ls = []
lxys << [lx, 0]
ls << lx
lxys << [0, ly]
ls << ly
while true do
  lx1, ly1 = lxys[-1]
  lx2, ly2 = lxys[-2]
  lxys << [lx1 + lx2, ly1 + ly2]
  ls << lxys[-1][0] + lxys[-1][1]
  break if r_max < ls[-1]
end

# pp(lxys:) if $debug
# pp(ls:) if $debug

def calc(r, c, ls, lxys, xs, ys)
  pp(r:, c:) if $debug
  return 0 if r <= 0
  # if r <= ls[1] # ly
  #   return Y.chars[0...r].tally[c]
  # end

  i = ls.length - 1
  ans = 0
  while true do
    if i == 0
      ans += X.chars[0...r].tally[c] || 0
      pp(i:, r:, ans:, type: 'a') if $debug
      return ans
    end
    if i == 1
      ans += Y.chars[0...r].tally[c] || 0
      pp(i:, r:, ans:, type: 'b') if $debug
      return ans
    end
    if r <= ls[i - 1]
      pp(i:, r:, ans:, type: 'c') if $debug
      i -= 1
      next
    end

    # ls[i - 1] < r
    lx, ly = lxys[i - 1]
    ans += lx * xs[c] + ly * ys[c]
    pp(i:, r:, ans:, type: 'd') if $debug
    r -= ls[i - 1]
    i -= 2
  end

  ans
end


LRCS.each do |l, r, c|
  pp(l:, r:, c:) if $debug
  ans1 = calc(r, c, ls, lxys, xs, ys)
  ans2 = calc(l - 1, c, ls, lxys, xs, ys)
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

