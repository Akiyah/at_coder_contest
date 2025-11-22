#!/usr/bin/env ruby

# acc n ContestID
# oj t -c " ruby main.rb" -d test
# acc s 


# require "ac-library-rb/priority_queue"
# require "ac-library-rb/segtree"
# require "ac-library-rb/dsu"

require "ac-library-rb/fenwick_tree"

fw = AcLibraryRb::FenwickTree.new([1,2,3])

# pq = AcLibraryRb::PriorityQueue.new

# require 'prime'
# pd = Prime.prime_division(a)

$debug = !ARGV[0].nil?

# N = STDIN.gets.chomp.to_i
N, Q = STDIN.gets.chomp.split.map(&:to_i)
AS = STDIN.gets.chomp.split.map(&:to_i)
TABS = Q.times.map do
  STDIN.gets.chomp.split.map(&:to_i)
end

pp(AS:, TABS:) if $debug

def update_as(ais, i2j, i, new_a)
  j = i2j[i]
  a = ais[j][0]
  ais[j][0] = new_a
end

def calc_sum(ais, i2j, l, r)
  ais.map do |a, i|
    [l, [r, a].min].max
  end.sum
end

def run
  ais = AS.map.with_index { |a, i| [a, i] } # a, i, t, tab, k
  TABS.each.with_index do |(t, a, b), k|
    if t == 1
      ais << [b, a, 1, [t, a, b], k]
    else
      ais << [a, nil, 2, [t, a, b], k]
      ais << [b, nil, 2, [t, a, b], k]
    end
  end
  ais.sort_by! { |a, i, t, tab, k| a }
  pp(ais:) if $debug

  as = []
  i2j = []
  k2j = []
  k2lr = []
  j = 0
  ais.each do |a, i, t, tab, k|
    if t == nil
      i2j[i] = j
      as << [a, a]
      j += 1
    elsif t == 1
      k2j[k] = j
      as << a
      j += 1
    else
      k2lr[k] ||= []
      if a == tab[1]
        k2lr[k][0] = j
      else
        k2lr[k][1] = j
      end
    end
  end


  pp(as:, i2j:, k2j:, k2lr:) if $debug



  #.sort_by { |a, i, k| a }
  # i2j = []
  # ais.map.with_index do |(a, i), j|
  #   i2j[i] = j
  # end

  # TABS.each.with_index do |(t, a, b), k|
  #   if t == 1
  #     update_as(ais, i2j, a - 1, b)
  #   else
  #     puts calc_sum(ais, i2j, a, b)
  #   end
  # end
end

run
