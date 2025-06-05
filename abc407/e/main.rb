#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
require "ac-library-rb/lazy_segtree"
# require "ac-library-rb/dsu"

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

T = STDIN.gets.chomp.to_i

def calc(n, as)
  ais = as.map.with_index { |a, i| [a, i]}
  ais_sorted = ais.sort_by { |a, i| a }.reverse

  vector = (2 * n).times.map { |i| i - 2 * n }
  e = - 10 ** 6
  id = 0

  seg = AcLibraryRb::LazySegtree.new(vector, e, id) { |x, y| [x, y].max }
  seg.set_mapping{ |f, x| f + x }
  seg.set_composition{ |f, g| f + g }

  pp(vector:, seg:) if $debug

  co = 0
  r = 0

  ais_sorted.each do |a, i|
    next if 0 < seg.prod(0, i + 1) + 2

    seg.range_apply(0, i + 1, 2)
    pp(a:, i:, all_prod: seg.all_prod) if $debug

    r += a
    co += 1

    return r if co == n
  end
end


T.times do |t|
  n = STDIN.gets.chomp.to_i
  as = (2 * n).times.map do
    STDIN.gets.chomp.to_i
  end
  pp(t:, n:, as:) if $debug
  puts calc(n, as)
end


