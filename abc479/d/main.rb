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

N, Q = STDIN.gets.chomp.split.map(&:to_i)
LS = STDIN.gets.chomp.split.map(&:to_i)
RS = STDIN.gets.chomp.split.map(&:to_i)
STS = (1..Q).map do
  STDIN.gets.chomp.split.map(&:to_i)
end


def calc_mins(ls)
  min_l = nil
  min_ls = []
  ls.reverse.each do |l|
    if !min_l || l < min_l
      min_l = l
    end
    min_ls << min_l
  end
  min_ls.reverse
end



min_ls = calc_mins(LS)
min_rs = calc_mins(RS.reverse)
min_rs.reverse!
pp(min_ls:, min_rs:) if $debug


def calc(s, t, min_ls, min_rs)
  pp(s:, t:) if $debug
  if s < t # 右に進む
    ans1 = RS[s] # 右に進む場合
    if 0 < s
      # 一度左に進む場合
      ans2 = LS[s - 1] + min_rs[s]
    end

  else # 左に進む
    ans1 = LS[s - 1] # 左に進む場合
    # 一度右に進む場合
    if s < N - 1
      ans2 = RS[s] + min_ls[s]
    end

  end
  pp(ans1:, ans2:) if $debug
  [ans1, ans2].compact.min
end


STS.each do |s1, t1|
  puts calc(s1 - 1, t1 - 1, min_ls, min_rs)
end


