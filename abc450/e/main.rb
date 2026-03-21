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

xs = X.chars.tally
ys = Y.chars.tally

lx = X.length
ly = Y.length

lxys = []
ls = []
lxys << [lx, 0]
ls << lx
lxys << [0, ly]
ls << ly
100.times do
  lx1, ly1 = lxys[-1]
  lx2, ly2 = lxys[-2]
  lxys << [lx1 + lx2, ly1 + ly2]
  ls << lxys[-1][0] + lxys[-1][1]
end

pp(lxys:) if $debug
pp(ls:) if $debug

# ss = []
# ss << X
# ss << Y
# 10.times do
#   ss << ss[-1] + ss[-2]
# end
# pp(ss:) if $debug

def calc1(r, c, ls, lxys, i)
  return 0 if r == 0
  if r <= ls[1] # ly
    return Y.chars[0...r].tally[c]
  end


  i = ls.bsearch_index { |l| r < l }

  l2 = l - ls[i - 1]
  calc(l2, c, ls, lxys)


end


def calc(r, c, ls, lxys)
  return 0 if r == 0
  if r <= ls[1] # ly
    return Y.chars[0...r].tally[c]
  end


  i = ls.bsearch_index { |l| r < l }
  calc1(r, c, ls, lxys, i)
end


LRCS.each do |l, r, c|
  pp(l:, r:, c:) if $debug



  puts calc(r, c, ls, lxys) - calc(l - 1, c, ls, lxys)

end

