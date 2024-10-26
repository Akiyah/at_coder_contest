#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
# N, A, X, Y = STDIN.gets.chomp.split.map(&:to_i)
# AS = (1..N).map do
#   STDIN.gets.chomp.to_i
#   STDIN.gets.chomp.split.map(&:to_i)
# end


N, M = STDIN.gets.chomp.split.map(&:to_i)

LRS = (1..N).map do
  STDIN.gets.chomp.split.map(&:to_i)
end

lrs = []
last_l = nil
LRS.sort.each do |l, r|
  if last_l != l
    lrs << [l, r]
  end
  last_l = l
end
# 同一のlは含まなくなる

pp lrs if $debug

min_r = M + 1
lrs2 = []
lrs.reverse.each do |l, r|
  # pp [l, r, min_r] if $debug
  next if min_r <= r # 不要なので除外

  lrs2 << [l, r]
  min_r = r
end

lrs2.reverse!

pp lrs2 if $debug

c = 0
last_l = 0
last_r = nil
lrs2.each do |l, r|
  pp [l, r, last_l, last_r, c] if $debug
  c += (l - last_l) * (M - r + 1)
  pp c if $debug

  last_l = l
  last_r = r
end




puts M * (M + 1) / 2 - c

