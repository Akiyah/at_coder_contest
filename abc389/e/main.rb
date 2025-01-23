#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

$debug = !ARGV[0].nil?

N, M = STDIN.gets.chomp.split.map(&:to_i)
PS = STDIN.gets.chomp.split.map(&:to_i)


def calc_price(a) # a 円以下のものを全部買ったときの金額
  pp ['calc_price(a)', a] if $debug

  PS.map do |p|
    k = (((a.to_f / p) + 1) / 2).floor
    p * (k ** 2)
  end.sum
end

def calc_count(a) # a 円以下のものを全部買ったときの個数
  PS.map do |p|
    k = (((a.to_f / p) + 1) / 2).floor
    k
  end.sum
end

def calc
  a_over = (0..(10**14)).bsearch do |a|
    M < calc_price(a)
  end

  # ちょうど a_over 円のものをいくつか取り除くと、答えになる
  m = calc_price(a_over) - M

  pp [a_over, calc_price(a_over), calc_count(a_over), M, m] if $debug

  calc_count(a_over) - m.ceildiv(a_over)
end

puts calc


